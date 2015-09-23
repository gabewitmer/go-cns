package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

func root(w http.ResponseWriter, r *http.Request, c *web.Context) {
	http.Redirect(w, r, "/login", 303)
}

func getLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	msgK, msgV := c.GetFlash()
	ts.Render(w, "login.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func postLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	email, password := r.FormValue("email"), r.FormValue("password")
	user, ok := GetUser(email, password)
	if !ok || (user.Role != "employee" && user.Role != "admin") {
		c.SetFlash("alertError", "Incorrect email or password")
		http.Redirect(w, r, "/login", 303)
		return
	}
	employee, ok := GetEmployee(user.Id)
	if !ok {
		c.SetFlash("alertError", "Error finding user")
		http.Redirect(w, r, "/login", 303)
		return
	}
	c.Login(user.Role)
	c.SetSession(map[string]interface{}{
		"emplyeeId": employee.Id,
		"email":     employee.Email,
	})
	if user.Role == "employee" {
		http.Redirect(w, r, "/employee/home", 303)
		return
	}
	if user.Role == "admin" {
		http.Redirect(w, r, "/admin/home", 303)
		return
	}
	return
}

func getLogout(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.Logout()
	http.Redirect(w, r, "/", 303)
}
