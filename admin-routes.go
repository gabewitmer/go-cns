package main

import "github.com/cagnosolutions/web"

func AdminRoutes(mux *web.Mux) {

	mux.Get("/admin/home", AdminHome)

	mux.Get("/admin/employee", AdminEmployeeGetAll)
	mux.Post("/admin/employee/add", AdminEmployeeAdd)
	mux.Post("/admin/employee/edit", AdminEmployeeEdit)
	mux.Get("/admin/employee/:id", AdminEmployeeGetOne)
	mux.Post("/admin/employee/:id", AdminEmployeeDelete)

	mux.Get("/admin/company", AdminCompanyGetAll)
	mux.Post("/admin/company", AdminCompanySave)
	mux.Get("/admin/company/new", AdminCompanyNew)
	mux.Get("/admin/company/:id", AdminCompanyGetOne)
	mux.Post("/admin/company/:id", AdminCompanyDelete)
	mux.Post("/admin/company/upload/:id", AdminUploadCompanyLogo)

	mux.Get("/admin/company/:companyId/driver", AdminCompanyDriverGetAll)
	mux.Post("/admin/company/:companyId/driver/add", AdminCompanyDriverAdd)
	mux.Post("/admin/company/:companyId/driver/edit", AdminCompanyDriverEdit)
	mux.Get("/admin/company/:companyId/driver/:driverId", AdminCompanyDriverGetOne)
	mux.Post("/admin/company/:companyId/driver/:driverId", AdminCompanyDriverDelete)

	mux.Get("/admin/company/:companyId/vehicle", AdminCompanyVehicleGetAll)
	mux.Post("/admin/company/:companyId/vehicle", AdminCompanyVehicleSave)
	mux.Get("/admin/company/:companyId/vehicle/:vehicleId", AdminCompanyVehicleGetOne)
	mux.Post("/admin/company/:companyId/vehicle/:vehicleId", AdminCompanyVehicleDelete)

	mux.Get("/admin/driver", AdminDriverGetAll)
	mux.Post("/admin/driver", AdminDriverSave)
	mux.Get("/admin/driver/:id", AdminDriverGetOne)
	mux.Post("/admin/driver/:id", AdminDriverDelete)

	/*
	   mux.Get("/admin/vehicle", AdminVehicleGetAll)
	   mux.Post("/admin/vehicle", AdminVehicleSave)
	   mux.Get("/admin/vehicle", AdminVehicleGetOne)
	   mux.Post("/admin/vehicle", AdminVehicleDelete)
	*/
}
