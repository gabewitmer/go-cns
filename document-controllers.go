package main

import (
	"fmt"
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/gabewitmer/go-cns/service"
)

// GET driver get document
func getDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/"+c.GetPathVar("slug"), "driver") {
		return
	}
	if c.GetFromSession("slug") != c.GetPathVar("slug") {
		http.Redirect(w, r, "/"+c.GetFromSession("slug").(string)+"/document/"+c.GetPathVar("id"), 303)
	}
	document := service.FindOneDocument(c.GetPathVar("id"))
	driver := service.FindOneDriver(c.GetFromSession("id").(string))
	if document.DriverId != driver.Id {
		http.Redirect(w, r, "/"+c.GetFromSession("slug").(string)+"/driver/", 303)
		return
	}
	ts.Render(w, document.Name+".tmpl", tmpl.Model{
		"driver":   driver,
		"company":  service.FindOneCompany(c.GetFromSession("companyId").(string)),
		"document": document,
	})

}

// POSt driver save document
func saveDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/"+c.GetPathVar("slug"), "driver") {
		return
	}
	document := service.FindOneDocument(r.FormValue("id"))
	document.Data = r.FormValue("data")
	service.SaveDocument(document)
	c.SetFlash("alertSuccess", "Successfully save document")
	fmt.Fprintf(w, "/%s/driver", c.GetPathVar("slug"))
}

// POST driver complate document
func completeDocument(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/"+c.GetPathVar("slug"), "driver") {
		return
	}
	document := service.FindOneDocument(r.FormValue("id"))
	document.Data = r.FormValue("data")
	document.Complete = true
	service.SaveDocument(document)
	c.SetFlash("alertSuccess", "Successfully completed document")
	fmt.Fprintf(w, "/%s/driver", c.GetPathVar("slug"))
}
