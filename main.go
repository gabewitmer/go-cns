package main

import (
	"github.com/cagnosolutions/web"
)

func main() {
	mux := web.NewMux("CTIXID", (web.HOUR / 2))
	mux.Get("/", getHome)
	mux.Get("/login", getLogin)
	mux.Get("/driver/home", getDriverHome)
	mux.Get("/admin/home", getAdminHome)
	mux.Get("/admin/companies", getAdminCompanies)
	mux.Get("/admin/company", getAdminCompany)
	mux.Get("/admin/company/drivers", getAdminCompanyDrivers)
	mux.Get("/admin/company/vehicles", getAdminCompanyVehicles)
	mux.Get("/success", setMessage)
	mux.Get("/hey/:name/you", getHey)
	mux.Serve(":8080")
}
