package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/cagnosolutions/web/util"
	"github.com/gabewitmer/go-cns/service"
)

// GET admin home
func AdminHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-home.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

// GET admin all employees
func AdminEmployeeGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-employee.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": service.FindAllEmployee(),
	})
	return
}

// POST add employee
func AdminEmployeeAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	email := r.FormValue("email")
	if !service.CanUpdate("", email) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/employee", 303)
		return
	}

	employee, user := service.NewEmployee(r.Form)
	service.SaveUser(user)
	service.SaveEmployee(employee)
	c.SetFlash("alertSuccess", "Successfully added employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// POST edit employee
func AdminEmployeeEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	email := r.FormValue("email")
	if !service.CanUpdate(r.FormValue("employeeId"), email) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/employee", 303)
		return
	}
	employee := service.MakeEmployee(r.Form)
	user := service.MakeUser(r.Form)
	service.SaveEmployee(employee)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// GET admin get one employee
func AdminEmployeeGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-employee.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": service.FindAllEmployee(),
		"employee":  service.FindOneEmployee(c.GetPathVar("id")),
	})
	return
}

// POST admin delete employee
func AdminEmployeeDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	service.DeleteEmployee(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// GET admin get companies
func AdminCompanyGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-companies.tmpl", tmpl.Model{
		msgK:        msgV,
		"companies": service.FindAllCompany(),
	})
	return
}

// POST admin save company
func AdminCompanySave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	company := service.MakeCompany(r.Form)
	company.Id = util.UUID4()
	service.SaveCompany(company)
	c.SetFlash("alertSuccess", "Successfully saved company")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

// GET admin add company page
func AdminCompanyNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-companies-form.tmpl", tmpl.Model{
		msgK:        msgV,
		"companies": service.FindAllCompany(),
	})
	return
}

// GET admin get company
func AdminCompanyGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	driverCount := 0
	vehicleCount := 0
	ts.Render(w, "admin-company.tmpl", tmpl.Model{
		msgK:           msgV,
		"company":      service.FindOneCompany(c.GetPathVar("id")),
		"driverCount":  driverCount,
		"vehicleCount": vehicleCount,
	})
	return
}

// POST admin delete company
func AdminCompanyDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	service.DeleteCompany(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted  company")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

// POST  admin upload company logo
func AdminUploadCompanyLogo(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}

	http.Redirect(w, r, "/admin/company", 303)
	return
}

// GGET admin get all company's drivers
func AdminCompanyDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:      msgV,
		"drivers": service.FindAllDriverByCompany(c.GetPathVar("companyId")),
		"company": service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

func AdminCompanyDriverNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-driver-form.tmpl", tmpl.Model{
		msgK:      msgV,
		"drivers": service.FindAllDriverByCompany(c.GetPathVar("companyId")),
		"company": service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

// POST admin add driver to company
func AdminCompanyDriverAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	if !service.CanUpdate("", r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
		return
	}
	driver, user := service.NewDriver(r.Form)
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully added driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// POST admin edit driver
func AdminCompanyDriverEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	if !service.CanUpdate(r.FormValue("driverId"), r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
		return
	}
	driver := service.MakeDriver(r.Form)
	user := service.MakeUser(r.Form)
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// GET admin get driver from company
func AdminCompanyDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-driver-form.tmpl", tmpl.Model{
		msgK:      msgV,
		"drivers": service.FindAllDriverByCompany(c.GetPathVar("companyId")),
		"driver":  service.FindOneDriver(c.GetPathVar("driverId")),
		"company": service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

/// POST admin delete driver from company
func AdminCompanyDriverDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	service.DeleteDriver(c.GetPathVar("driverId"))
	c.SetFlash("alertSuccess", "Successfully deleted driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// GET admin get all company's vehicles
func AdminCompanyVehicleGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:       msgV,
		"addNew":   r.FormValue("addNew") == "true",
		"vehicles": service.FindAllVehicleByCompany(c.GetPathVar("companyId")),
		"company":  service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

// POST admin save vehilce to company
func AdminCompanyVehicleSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	vehicle := service.MakeVehicle(r.Form)
	service.SaveVehicle(vehicle)
	c.SetFlash("alertSuccess", "Successfully saved vehicle")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/vehicle", 303)
	return
}

// GET admin get vehicle from company
func AdminCompanyVehicleGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:       msgV,
		"vehicles": service.FindAllVehicleByCompany(c.GetPathVar("companyId")),
		"vehicle":  service.FindOneVehicle(c.GetPathVar("vehicleId")),
		"company":  service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

// POST admin delete vehicle from company
func AdminCompanyVehicleDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	service.DeleteVehicle(c.GetPathVar("vehicleId"))
	c.SetFlash("alertSuccess", "Successfuly deleted vehicle")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

// GET admin get all drivers
func AdminDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-driver.tmpl", tmpl.Model{
		msgK:      msgV,
		"drivers": service.FindAllDriver(),
	})
	return
}

// POST admin save driver
func AdminDriverSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	if !service.CanUpdate("", r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/driver/"+c.GetPathVar("id"), 303)
		return
	}
	driver := service.MakeDriver(r.Form)
	user := service.MakeUser(r.Form)
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved driver")
	http.Redirect(w, r, "/admin/driver/"+driver.Id, 303)
	return
}

// GEt admin get driver
func AdminDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-driver.tmpl", tmpl.Model{
		msgK:      msgV,
		"driver":  service.FindOneDriver(c.GetPathVar("id")),
		"drivers": service.FindAllDriver(),
	})
	return
}

// POST admin delete driver
func AdminDriverDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "admin", "/login") {
		return
	}
	service.DeleteDriver(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted driver")
	http.Redirect(w, r, "/admin/driver", 303)
	return
}

/*
// GET admin get all vehicles
func AdminVehicleGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-vehicle.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func AdminVehicleSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/vehicle", 303)
	return
}

func AdminVehicleGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-vehicle.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func AdminVehicleDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/vehicle", 303)
	return
}
*/
