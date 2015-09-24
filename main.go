package main

import (
	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

var ts = tmpl.NewTemplateStore(true)
var db DB

func main() {
	mux := web.NewMux("CTIXID", (web.HOUR / 2))

	mux.Get("/", root)
	mux.Get("/login", getLogin)
	mux.Post("/login", postLogin)
	mux.Get("/logout", getLogout)

	AdminRoutes(mux)

	mux.Get("/:slug", companyLanding)
	mux.Get("/:slug/login", companyLogin)
	mux.Post("/:slug/login", postCompanyLogin)
	mux.Get("/:slug/logout", companyLogout)
	mux.Get("/:slug/register", companyRegister)
	mux.Post("/:slug/register", postCompanyRegister)
	mux.Get("/:slug/driver", getDriverHome)
	mux.Get("/:slug/document/:id", getDocument)

	mux.Serve(":8080")
}
