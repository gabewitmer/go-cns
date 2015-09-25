package main

import (
	"fmt"
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

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
