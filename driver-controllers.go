package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/gabewitmer/go-cns/service"
)

func getDriverHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "driver", "/"+c.GetPathVar("slug")) {
		return
	}
	if c.GetFromSession("slug") != c.GetPathVar("slug") {
		http.Redirect(w, r, "/"+c.GetFromSession("slug").(string)+"/driver", 303)
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "driver-home.tmpl", tmpl.Model{
		msgK:        msgV,
		"driver":    service.FindOneDriver(c.GetFromSession("id").(string)),
		"slug":      c.GetPathVar("slug"),
		"documents": service.FindAllDocumentByDriver(c.GetFromSession("id").(string)),
	})
	return
}
