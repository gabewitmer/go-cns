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

	//mux.Get("/driver/home", getDriverHome)

	mux.Serve(":8080")
}
