package main

import (
	"fmt"
	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"net/http"
)

var ts = tmpl.NewTemplateStore(true)

func getHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	msgK, msgV := c.GetFlash()
	m1 := make(map[string]string)
	m1["message"] = "hello"
	m1["message2"] = "world"
	ss := []string{"hey", "I", "am"}
	ss = append(ss, "butts")
	ts.Render(w, "index.tmpl", tmpl.Model{
		msgK:    msgV,
		"map1":  m1,
		"slice": ss,
	})
	return
}

func setMessage(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.SetFlash("alertSuccess", "Successfully did something")
	http.Redirect(w, r, "/", 303)
}

func getLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "login.tmpl", tmpl.Model{})
	return
}

func getDriverHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "driverHome.tmpl", tmpl.Model{})
	return
}

func getAdminHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "admin-home.tmpl", tmpl.Model{})
	return
}

func getAdminCompanies(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "admin-companies.tmpl", tmpl.Model{})
	return
}

func getAdminCompany(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "admin-company.tmpl", tmpl.Model{})
	return
}

func getAdminCompanyDrivers(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "admin-company-drivers.tmpl", tmpl.Model{})
	return
}

func getAdminCompanyVehicles(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "admin-company-vehicles.tmpl", tmpl.Model{})
	return
}

func getHey(w http.ResponseWriter, r *http.Request, c *web.Context) {
	yourMom := c.GetPathVar("name")
	fmt.Fprintf(w, "%s is a loving mother", yourMom)
	return
}
