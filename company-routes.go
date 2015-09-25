package main

import "github.com/cagnosolutions/web"

func CompanyRoutes(mux *web.Mux) {

    mux.Get("/:slug", companyLanding)
    mux.Get("/:slug/login", companyLogin)
    mux.Post("/:slug/login", postCompanyLogin)
    mux.Get("/:slug/logout", companyLogout)
    mux.Get("/:slug/register", companyRegister)
    mux.Post("/:slug/register", postCompanyRegister)
    
}
