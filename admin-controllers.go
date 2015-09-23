package main

import (
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
)

func AdminHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-home.tmpl", tmpl.Model{
		msgK: msgV,
	})
	return
}

func AdminEmployeeGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-employee.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": db.GetStore("employee"),
	})
	return
}

func AdminEmployeeAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/employee", 303)
	return
}

func AdminEmployeeEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/employee", 303)
	return
}

func AdminEmployeeGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()

	ts.Render(w, "admin-employee.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": db.GetStore("employee"),
		"employee":  db.Get("employee", c.GetPathVar("id")),
	})
	return
}

func AdminEmployeeDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	var employee Employee
	id := c.GetPathVar("id")
	ok := db.GetAs("employee", id, &employee)
	if ok {
		db.Del("user", employee.UserId)
		db.Del("employee", id)
	}
	c.SetFlash("alertSuccess", "Successfully deleted employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

func AdminCompanyGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-companies.tmpl", tmpl.Model{
		msgK:        msgV,
		"addNew":    r.FormValue("addNew") == "true",
		"companies": db.GetStore("companies"),
	})
	return
}

func AdminCompanySave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")

	http.Redirect(w, r, "/admin/company", 303)
	return
}

func AdminCompanyGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	c.CheckAuth(w, r, "admin", "/login")
	msgK, msgV := c.GetFlash()
	driverCount := 0
	vehicleCount := 0
	ts.Render(w, "admin-company.tmpl", tmpl.Model{
		msgK:           msgV,
		"company":      db.Get("companny", c.GetPathVar("id")),
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
