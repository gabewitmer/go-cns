package main

import (
	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"net/http"
)

func getDriverHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	ts.Render(w, "driverHome.tmpl", tmpl.Model{})
	return
}
