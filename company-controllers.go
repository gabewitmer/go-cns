package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/cagnosolutions/web/util"
	"github.com/gabewitmer/go-cns/service"
)

// GEt get company landing page
func companyLanding(w http.ResponseWriter, r *http.Request, c *web.Context) {
	company, ok := service.FindOneCompanyBySlug(c.GetPathVar("slug"))
	if !ok || !company.Feature {
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

// GET get company login page
func companyLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	company, ok := service.FindOneCompanyBySlug(c.GetPathVar("slug"))
	if !ok || !company.Feature {
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

// POST post to cmopany login
func postCompanyLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	company, ok := service.FindOneCompanyBySlug(c.GetPathVar("slug"))
	if !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	driver, ok2 := service.FindOneDriverByCompanyLogin(r.FormValue("email"), r.FormValue("password"), company.Id)
	if !ok2 {
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

// GET get company register page
func companyRegister(w http.ResponseWriter, r *http.Request, c *web.Context) {
	company, ok := service.FindOneCompanyBySlug(c.GetPathVar("slug"))
	if !ok || !company.Feature {
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
	company, ok := service.FindOneCompanyBySlug(c.GetPathVar("slug"))
	if !ok || !company.Feature {
		fmt.Fprintf(w, "404 Not Page Found")
		return
	}
	if !service.CanUpdate("", r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	driver, user := service.NewDriver(r.Form)
	fmt.Println(driver.DOB)
	dobTS, err := time.Parse("2006-01-02", driver.DOB)
	if err != nil {
		c.SetFlash("alertError", "Error invalid date of birth")
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	if age := service.GetDriverAge(dobTS.UnixNano()); age < company.AgeRequirement {
		c.SetFlash("alertError", "Not old enough sucker")
		user.Active = false
		driver.Status = 0
		driver.CompanyId = ""
		service.SaveUser(user)
		service.SaveDriver(driver)
		http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/register", 303)
		return
	}
	documentId := util.UUID4()
	document := service.Document{
		Id:         documentId,
		DocumentId: "100",
		CompanyId:  company.Id,
		DriverId:   driver.Id,
		Name:       "dqf-100",
		Complete:   false,
	}
	service.SaveUser(user)
	service.SaveDriver(driver)
	service.SaveDocument(document)
	c.SetFlash("alertSuccess", "Successfully Registered for "+company.Name+". Please Login")
	http.Redirect(w, r, "/"+c.GetPathVar("slug")+"/login", 303)
	return
}

// POST company logout
func companyLogout(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.Logout()
	http.Redirect(w, r, "/"+c.GetPathVar("slug"), 303)
}
