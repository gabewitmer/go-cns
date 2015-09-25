package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
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
	}
	employeeId := web.UUID4()
	employee := service.MakeEmployee(r.Form)
	userId := web.UUID4()
	user := service.User{
		Id:       userId,
		Email:    email,
		Password: email,
		Role:     "employee",
		Active:   true,
	}
	employee.UserId = userId
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
		"addNew":    r.FormValue("addNew") == "true",
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
	company.Id = web.UUID4()
	service.SaveCompany(company)
	c.SetFlash("alertSuccess", "Successfully saved company")
	http.Redirect(w, r, "/admin/company", 303)
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

func AdminCompanyDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	var company Company
	id := c.GetPathVar("id")
	ok := db.GetAs("company", id, &company)
	if ok {
		db.Del("user", company.UserId)
		db.Del("user", id)
	}
	c.SetFlash("alertSuccess", "Successfully deleted  company")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

func AdminUploadCompanyLogo(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/company", 303)
	return
}

func AdminCompanyDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	var drivers []Driver
	// db.QueryAll("driver", map[string]interface{}{"companyId": c.GetPathVar("companyId")}, &drivers)
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:      msgV,
		"addNew":  r.FormValue("addNew") == "true",
		"drivers": drivers,
		"company": db.Get("company", c.GetPathVar("companyId")),
	})
	return
}

func AdminCompanyDriverAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/company"+c.GetPathVar("companyId"), 303)
	return
}

func AdminCompanyDriverEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/company"+c.GetPathVar("companyId"), 303)
	return
}

func AdminCompanyDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	var drivers []Driver
	// db.QueryAll("driver", map[string]interface{}{"companyId": c.GetPathVar("companyId")}, &drivers)
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:      msgV,
		"addNew":  r.FormValue("addNew") == "true",
		"drivers": drivers,
		"driver":  db.Get("driver", c.GetPathVar("driverId")),
		"company": db.Get("company", c.GetPathVar("companyId")),
	})
	return
}

func AdminCompanyDriverDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	var driver Driver
	id := c.GetPathVar("driverId")
	if ok := db.GetAs("driver", id, driver); ok {
		db.Del("user", driver.UserId)
		db.Del("driver", id)
	}
	c.SetFlash("alertSuccess", "Successfully deleted driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId"), 303)
	return
}

func AdminCompanyVehicleGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	var vehicles []Vehicle
	// db.QueryAll("driver", map[string]interface{}{"companyId": c.GetPathVar("companyId")}, &drivers)
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:       msgV,
		"addNew":   r.FormValue("addNew") == "true",
		"vehicles": vehicles,
		"company":  db.Get("company", c.GetPathVar("companyId")),
	})
	return
}

func AdminCompanyVehicleSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/company", 303)
	return
}

func AdminCompanyVehicleGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	var vehicles []Vehicle
	// db.QueryAll("driver", map[string]interface{}{"companyId": c.GetPathVar("companyId")}, &drivers)
	ts.Render(w, "admin-company-driver.tmpl", tmpl.Model{
		msgK:       msgV,
		"addNew":   r.FormValue("addNew") == "true",
		"vehicles": vehicles,
		"vehicle":  db.Get("vehicle", c.GetPathVar("vehicleId")),
		"company":  db.Get("company", c.GetPathVar("companyId")),
	})
	return
}

func AdminCompanyVehicleDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	db.Del("vehicle", c.GetPathVar("vehicleId"))
	c.SetFlash("alertSuccess", "Successfuly deleted vehicle")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

func AdminDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-driver.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func AdminDriverSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/driver", 303)
	return
}

func AdminDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-driver.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func AdminDriverDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/driver", 303)
	return
}

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
