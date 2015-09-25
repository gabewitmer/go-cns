package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

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
