package main

import (
	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

var ts = tmpl.NewTemplateStore(true)

func main() {
	mux := web.NewMux("CTIXID", (web.HOUR / 2))

	mux.Get("/", root)
	mux.Get("/login", getLogin)
	mux.Post("/login", postLogin)
	mux.Get("/logout", getLogout)

	AdminRoutes(mux)
	CompanyRoutes(mux)

	mux.Get("/:slug/driver", getDriverHome)

	mux.Post("/:slug/document/save", saveDocument)
	mux.Post("/:slug/document/complete", completeDocument)
	mux.Get("/:slug/document/:id", getDocument)

	mux.Serve(":8080")
}
