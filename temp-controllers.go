package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math"
	"net/http"
	"time"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

func companyLanding(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var company Company
	if ok := GetCompBySlug(c.GetPathVar("slug"), &company); !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "company-landing.tmpl", tmpl.Model{
		msgK:      msgV,
		"company": company,
	})
	return
}

func companyLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var company Company
	if ok := GetCompBySlug(c.GetPathVar("slug"), &company); !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "company-login.tmpl", tmpl.Model{
		msgK:      msgV,
		"company": company,
	})
	return
}

func postCompanyLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var company Company
	if ok := db.GetAs("company", r.FormValue("companyId"), &company); !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	var driver Driver
	if ok := GetDriverFromLogin(r.FormValue("email"), r.FormValue("password"), company.Id, &driver); !ok {
		c.SetFlash("alertError", "Invalid email or password")
		http.Redirect(w, r, "/"+company.Slug+"/login", 303)
		return
	}
	c.Login("driver")
	c.SetSession(map[string]interface{}{
		"id":        driver.Id,
		"companyId": driver.CompanyId,
		"userId":    driver.UserId,
		"email":     driver.Email,
		"slug":      company.Slug,
	})
	c.SetFlash("alertSuccess", "Welcome "+driver.FirstName+" "+driver.LastName)
	http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/driver", 303)
	return
}

func companyRegister(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var company Company
	if ok := GetCompBySlug(c.GetPathVar("slug"), &company); !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "company-register.tmpl", tmpl.Model{
		msgK:      msgV,
		"company": company,
	})
	return
}

func postCompanyRegister(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var company Company
	if ok := db.GetAs("company", r.FormValue("companyId"), &company); !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	email := r.FormValue("email")
	if !CanUpdate("", email) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	dob := r.FormValue("dateOfBirth")
	dobTS, err := time.Parse("2006-01-02", dob)
	if err != nil {
		c.SetFlash("alertError", "Error invalid date of birth")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	userId := web.UUID4()
	user := User{
		Id:       userId,
		Email:    email,
		Password: email,
		Role:     "driver",
		Active:   true,
	}
	driverId := web.UUID4()
	driver := Driver{
		Id:        driverId,
		FirstName: r.FormValue("firstName"),
		LastName:  r.FormValue("lastName"),
		Street:    r.FormValue("street"),
		City:      r.FormValue("city"),
		State:     r.FormValue("state"),
		Zip:       r.FormValue("zip"),
		Email:     r.FormValue("email"),
		DOB:       dob,
		Status:    1,
		UserId:    userId,
		CompanyId: company.Id,
	}
	if age := GetDriverAge(dobTS.UnixNano()); age < company.AgeRequirement {
		c.SetFlash("alertError", "Not old enough sucker")
		user.Active = false
		driver.Status = 0
		driver.CompanyId = ""
		db.Set("user", userId, user)
		db.Set("driver", driverId, driver)
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	documentId := web.UUID4()
	document := Document{
		Id:         documentId,
		DocumentId: "100",
		CompanyId:  company.Id,
		DriverId:   driverId,
		Name:       "dqf-100",
		Complete:   false,
	}
	db.Set("document", documentId, document)
	db.Set("user", userId, user)
	db.Set("driver", driverId, driver)
	c.SetFlash("alertSuccess", "Successfully Registered for "+company.Name+". Please Login")
	http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/login", 303)
	return
}

func companyLogout(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.Logout()
	http.Redirect(w, r, "/"+c.GetPathVar("slug"), 303)
}

func getDriverHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "driver", "/"+c.GetPathVar("slug")) {
		return
	}
	if c.GetFromSession("slug") != c.GetPathVar("slug") {
		http.Redirect(w, r, "/"+c.GetFromSession("slug").(string), 303)
	}

	var driver Driver
	if ok := db.GetAs("driver", c.GetFromSession("id").(string), &driver); !ok {
		c.SetFlash("alertError", "Error finding driver")
		c.Logout()
		http.Redirect(w, r, "/"+c.GetPathVar("slug"), 303)
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "driver-home.tmpl", tmpl.Model{
		msgK:        msgV,
		"driver":    driver,
		"slug":      c.GetPathVar("slug"),
		"documents": GetDriverDocuments(driver.Id),
	})
	return
}

func getDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "driver", "/"+c.GetPathVar("slug")) {
		return
	}
	var driver Driver
	if ok := db.GetAs("driver", c.GetFromSession("id").(string), &driver); !ok {
		c.SetFlash("alertError", "Error finding driver")
		c.Logout()
		http.Redirect(w, r, "/"+c.GetPathVar("slug"), 303)
		return
	}
	var company Company
	if ok := db.GetAs("company", c.GetFromSession("companyId").(string), &company); !ok {
		c.SetFlash("alertError", "Error finding company")
		c.Logout()
		http.Redirect(w, r, "/"+c.GetPathVar("slug"), 303)
		return
	}
	var document Document
	if ok := db.GetAs("document", c.GetPathVar("id"), &document); !ok {
		c.SetFlash("alertError", "Error finding document")
		//c.Logout()
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/driver", 303)
		return
	}
	ts.Render(w, document.Name+".tmpl", tmpl.Model{
		"driver":   driver,
		"company":  company,
		"document": document,
	})

}

func saveDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "driver", "/"+c.GetPathVar("slug")) {
		return
	}
	var document Document
	if ok := db.GetAs("document", r.FormValue("id"), &document); !ok {
		c.SetFlash("alertError", "Error finding document")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/driver", 303)
		return
	}
	document.Data = r.FormValue("data")
	db.Set("document", r.FormValue("id"), document)
	c.SetFlash("alertSuccess", "Successfully save document")
	fmt.Fprintf(w, "/%s/driver", c.GetPathVar("slug"))
}

func completeDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "driver", "/"+c.GetPathVar("slug")) {
		return
	}
	var document Document
	if ok := db.GetAs("document", r.FormValue("id"), &document); !ok {
		c.SetFlash("alertError", "Error finding document")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/driver", 303)
		return
	}
	document.Data = r.FormValue("data")
	document.Complete = true
	db.Set("document", r.FormValue("id"), document)
	c.SetFlash("alertSuccess", "Successfully completed document")
	fmt.Fprintf(w, "/%s/driver", c.GetPathVar("slug"))
}

func GetCompBySlug(slug string, ptr interface{}) bool {
	for _, company := range *db.GetStore("company") {
		if company.(map[string]interface{})["Slug"] == slug {
			b, err := json.Marshal(company)
			if err != nil {
				log.Fatal(err)
			}
			if err := json.Unmarshal(b, &ptr); err != nil {
				log.Fatal(err)
			}
			return true
		}
	}
	return false
}

func GetDriverAge(dob int64) int32 {
	diff := time.Now().UnixNano() - dob
	return int32(math.Floor((float64(diff) / float64(1000) / float64(1000) / float64(1000) / float64(60) / float64(60) / float64(24) / float64(365.25))))
}

func GetDriverFromLogin(email, password, companyId string, ptr interface{}) bool {
	var userId string
	for _, user := range *db.GetStore("user") {
		if user.(map[string]interface{})["Email"] == email && user.(map[string]interface{})["Password"] == password && user.(map[string]interface{})["Active"] == true {
			userId = user.(map[string]interface{})["Id"].(string)
			break
		}
	}
	if userId == "" {
		return false
	}
	for _, driver := range *db.GetStore("driver") {
		if driver.(map[string]interface{})["UserId"] == userId && driver.(map[string]interface{})["CompanyId"] == companyId {
			b, err := json.Marshal(driver)
			if err != nil {
				log.Fatal(err)
			}
			if err := json.Unmarshal(b, &ptr); err != nil {
				log.Fatal(err)
			}
			return true
		}
	}
	return false
}

func GetDriverDocuments(driverId string) []interface{} {
	var docs []interface{}
	for _, document := range *db.GetStore("document") {
		//fmt.Printf("doc driver Id: %s", )
		if document.(map[string]interface{})["Complete"] == false && document.(map[string]interface{})["DriverId"] == driverId {
			docs = append(docs, document)
		}
	}
	return docs
}

func CanUpdate(id, email string) bool {
	for _, user := range *db.GetStore("user") {
		if user.(map[string]interface{})["Id"] != id && user.(map[string]interface{})["Email"] == email {
			return false
		}
	}
	return true
}
