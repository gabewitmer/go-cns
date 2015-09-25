package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

func companyLanding(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var comp company.Company
	if ok := GetCompBySlug(c.GetPathVar("slug"), &comp); !ok || !comp.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "company-landing.tmpl", tmpl.Model{
		msgK:      msgV,
		"company": comp,
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
	dob := FormatDate(r.FormValue("dateOfBirth"))
	dobTS, err := time.Parse("01/02/2006", dob)
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
