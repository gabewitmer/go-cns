package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/gabewitmer/go-cns/service"
)

// GET root
func root(w http.ResponseWriter, r *http.Request, c *web.Context) {
	var url string
	switch c.GetRole() {
	case "admin", "employee":
		url = "/admin/home"
	case "driver":
		url = "/" + c.GetFromSession("slug").(string) + "/driver"
	default:
		url = "/login"
	}
	http.Redirect(w, r, url, 303)
}

// GET get main login page
func getLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	msgK, msgV := c.GetFlash()
	m := map[string]string{"key1": "val1", "key2": "val2"}
	ts.Render(w, "login.tmpl", tmpl.Model{
		msgK: msgV,
		"m":  m,
		"keyToMap": "key1",
	})
	return
}

// POST submit main login
func postLogin(w http.ResponseWriter, r *http.Request, c *web.Context) {
	employee, role, ok := service.FindOneEmployeeByLogin(r.FormValue("email"), r.FormValue("password"))
	if !ok {
		c.SetFlash("alertError", "Incorrect email or password")
		http.Redirect(w, r, "/login", 303)
		return
	}
	c.Login(role)
	c.SetSession(map[string]interface{}{
		"emplyeeId": employee.Id,
		"email":     employee.Email,
	})
	//if role == "employee" {
	//	http.Redirect(w, r, "/employee/home", 303)
	//	return
	//}
	//if role == "admin" {
	//	http.Redirect(w, r, "/admin/home", 303)
	//	return
	//}
	http.Redirect(w, r, "/admin/home", 303)
	return
}

func getLogout(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.Logout()
	http.Redirect(w, r, "/", 303)
}
