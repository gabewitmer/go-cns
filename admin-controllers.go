package main

import (
	"fmt"
	"net/http"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/cagnosolutions/web/util"
	"github.com/gabewitmer/go-cns/service"
)

// GET admin home
func AdminHome(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
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
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-employee.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": service.FindAllEmployee(),
		"users":     service.UserRoles(),
	})
	return
}

// GET admin new employee page
func AdminEmployeeNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-employee-form.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": service.FindAllEmployee(),
		"users":     service.UserRoles(),
	})
	return
}

// POST add employee
func AdminEmployeeAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	if !service.CanUpdate("", r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/employee/new", 303)
		return
	}
	r.ParseForm()
	employee, user := service.NewEmployee(r.Form)
	service.SaveUser(user)
	service.SaveEmployee(employee)
	c.SetFlash("alertSuccess", "Successfully added employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// POST edit employee
func AdminEmployeeEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	if !service.CanUpdate(r.FormValue("userId"), r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/employee/"+r.FormValue("id"), 303)
		return
	}
	r.ParseForm()
	employee := service.FindOneEmployee(r.FormValue("id"))
	util.FormToStruct(&employee, r.Form, "")
	user := service.FindOneUser(employee.UserId)
	util.FormToStruct(&user, r.Form, "")
	user.Id = employee.UserId
	service.SaveEmployee(employee)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// GET admin get one employee
func AdminEmployeeGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-employee-form.tmpl", tmpl.Model{
		msgK:        msgV,
		"employees": service.FindAllEmployee(),
		"employee":  service.FindOneEmployee(c.GetPathVar("id")),
		"users":     service.UserRoles(),
	})
	return
}

// POST admin delete employee
func AdminEmployeeDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	service.DeleteEmployee(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted employee")
	http.Redirect(w, r, "/admin/employee", 303)
	return
}

// GET admin get companies
func AdminCompanyGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-companies.tmpl", tmpl.Model{
		msgK:        msgV,
		"companies": service.FindAllCompany(),
	})
	return
}

// POST admin add company
func AdminCompanyAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	r.ParseForm()
	var company service.Company
	util.FormToStruct(&company, r.Form, "")
	company.Id = util.UUID4()
	service.SaveCompany(company)
	c.SetFlash("alertSuccess", "Successfully saved company")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

// POST admin edit company
func AdminCompanyEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	r.ParseForm()
	company := service.FindOneCompany(r.FormValue("id"))
	util.FormToStruct(&company, r.Form, "")
	service.SaveCompany(company)
	c.SetFlash("alertSuccess", "Successfully saved company")
	http.Redirect(w, r, "/admin/company/"+r.FormValue("id"), 303)
	return
}

// GET admin new company page
func AdminCompanyNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
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
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company.tmpl", tmpl.Model{
		msgK:           msgV,
		"company":      service.FindOneCompany(c.GetPathVar("id")),
		"driverCount":  service.GetDriverCount(c.GetPathVar("id")),
		"vehicleCount": service.GetVehicleCount(c.GetPathVar("id")),
	})
	return
}

// POST admin delete company
func AdminCompanyDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteCompany(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted  company")
	http.Redirect(w, r, "/admin/company", 303)
	return
}

// POST admin upload company logo
func AdminUploadCompanyLogo(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}

	http.Redirect(w, r, "/admin/company", 303)
	return
}

// GET admin get all company's drivers
func AdminCompanyDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
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

// GET admin get new driver form company page
func AdminCompanyDriverNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
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
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	if !service.CanUpdate("", r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver/new", 303)
		return
	}
	r.ParseForm()
	driver, user := service.NewDriver(r.Form)
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully added driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// POST admin edit driver
func AdminCompanyDriverEdit(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	if !service.CanUpdate(r.FormValue("userId"), r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver/"+r.FormValue("id"), 303)
		return
	}
	r.ParseForm()
	driver := service.FindOneDriver(r.FormValue("id"))
	util.FormToStruct(&driver, r.Form, "")
	user := service.FindOneUser(driver.UserId)
	util.FormToStruct(&user, r.Form, "")
	user.Id = driver.UserId
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// GET admin get driver from company
func AdminCompanyDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
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
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteDriver(c.GetPathVar("driverId"))
	c.SetFlash("alertSuccess", "Successfully deleted driver")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/driver", 303)
	return
}

// GET admin get all company's vehicles
func AdminCompanyVehicleGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-vehicle.tmpl", tmpl.Model{
		msgK:       msgV,
		"vehicles": service.FindAllVehicleByCompany(c.GetPathVar("companyId")),
		"company":  service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

// POST admin save vehilce to company
func AdminCompanyVehicleSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	r.ParseForm()
	vehicle := service.FindOneVehicle(r.FormValue("id"))
	util.FormToStruct(&vehicle, r.Form, "")
	if vehicle.Id == "" {
		vehicle.Id = util.UUID4()
	}
	service.SaveVehicle(vehicle)
	c.SetFlash("alertSuccess", "Successfully saved vehicle")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/vehicle", 303)
	return
}

// GET admin get new vehicle page
func AdminCompanyVehicleNew(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-vehicle-form.tmpl", tmpl.Model{
		msgK:       msgV,
		"vehicles": service.FindAllVehicleByCompany(c.GetPathVar("companyId")),
		"company":  service.FindOneCompany(c.GetPathVar("companyId")),
	})
}

// GET admin get vehicle from company
func AdminCompanyVehicleGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-company-vehicle-form.tmpl", tmpl.Model{
		msgK:       msgV,
		"vehicles": service.FindAllVehicleByCompany(c.GetPathVar("companyId")),
		"vehicle":  service.FindOneVehicle(c.GetPathVar("vehicleId")),
		"company":  service.FindOneCompany(c.GetPathVar("companyId")),
	})
	return
}

// POST admin delete vehicle from company
func AdminCompanyVehicleDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteVehicle(c.GetPathVar("vehicleId"))
	c.SetFlash("alertSuccess", "Successfuly deleted vehicle")
	http.Redirect(w, r, "/admin/company/"+c.GetPathVar("companyId")+"/vehicle", 303)
	return
}

// GET admin get all drivers
func AdminDriverGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-driver.tmpl", tmpl.Model{
		msgK:        msgV,
		"drivers":   service.FindAllDriver(),
		"companies": service.CompanyNames(),
	})
	return
}

// POST admin save driver
func AdminDriverSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	if !service.CanUpdate(r.FormValue("userId"), r.FormValue("email")) {
		c.SetFlash("alertError", "Email already registered")
		http.Redirect(w, r, "/admin/driver/"+c.GetPathVar("id"), 303)
		return
	}
	r.ParseForm()
	driver := service.FindOneDriver(r.FormValue("id"))
	util.FormToStruct(&driver, r.Form, "")
	user := service.FindOneUser(driver.UserId)
	util.FormToStruct(&user, r.Form, "")
	user.Id = driver.UserId
	service.SaveDriver(driver)
	service.SaveUser(user)
	c.SetFlash("alertSuccess", "Successfully saved driver")
	http.Redirect(w, r, "/admin/driver", 303)
	return
}

// GET admin get driver
func AdminDriverGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-driver-form.tmpl", tmpl.Model{
		msgK:        msgV,
		"driver":    service.FindOneDriver(c.GetPathVar("id")),
		"drivers":   service.FindAllDriver(),
		"companies": service.CompanyNames(),
	})
	return
}

// POST admin delete driver
func AdminDriverDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteDriver(c.GetPathVar("id"))
	c.SetFlash("alertSuccess", "Successfully deleted driver")
	http.Redirect(w, r, "/admin/driver", 303)
	return
}

// GET admin get all vehicles
func AdminVehicleGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-vehicle.tmpl", tmpl.Model{
		msgK:        msgV,
		"vehicles":  service.FindAllVehicle(),
		"companies": service.CompanyNames(),
	})
	return
}

func AdminVehicleSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	r.ParseForm()
	vehicle := service.FindOneVehicle(r.FormValue("id"))
	util.FormToStruct(&vehicle, r.Form, "")
	service.SaveVehicle(vehicle)
	c.SetFlash("alertSuccess", "Successfully saved vehicle")
	http.Redirect(w, r, "/admin/vehicle", 303)
	return
}

func AdminVehicleGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-vehicle-form.tmpl", tmpl.Model{
		msgK:        msgV,
		"vehicle":   service.FindOneVehicle(c.GetPathVar("id")),
		"vehicles":  service.FindAllVehicle(),
		"companies": service.CompanyNames(),
	})
	return
}

func AdminVehicleDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteVehicle(c.GetPathVar("vehicleId"))
	c.SetFlash("alertSuccess", "Successfuly deleted vehicle")
	http.Redirect(w, r, "/admin/vehicle", 303)
	return
}

func AdminDriverDocumentGetAll(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "admin-driver-document.tmpl", tmpl.Model{
		msgK:        msgV,
		"driver":    service.FindOneDriver(c.GetPathVar("driverId")),
		"documents": service.FindAllDocumentByDriver(c.GetPathVar("driverId")),
		"dqfs":      service.DQFS,
	})
	return
}

func AdminDriverDocumentAdd(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	driver := service.FindOneDriver(c.GetPathVar("driverId"))
	docIds := util.SliceString(r.FormValue("docIds"), ',')
	for _, id := range docIds {
		document := service.Document{
			Id:         util.UUID4(),
			Name:       "dqf-" + id,
			DocumentId: id,
			Complete:   false,
			CompanyId:  driver.CompanyId,
			DriverId:   driver.Id,
		}
		service.SaveDocument(document)
	}
	c.SetFlash("alertSuccess", "Successfully added documents")
	http.Redirect(w, r, "/admin/driver/"+c.GetPathVar("driverId")+"/document", 303)

}

func AdminDriverDocumentGetOne(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	driver := service.FindOneDriver(c.GetPathVar("driverId"))
	document := service.FindOneDocument(c.GetPathVar("documentId"))
	ts.Render(w, document.Name+".tmpl", tmpl.Model{
		"driver":   driver,
		"company":  service.FindOneCompany(driver.CompanyId),
		"document": document,
		"admin":    true,
	})
}

func AdminDriverDocumentSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	document := service.FindOneDocument(r.FormValue("id"))
	document.Data = r.FormValue("data")
	service.SaveDocument(document)
	c.SetFlash("alertSuccess", "Successfully save document")
	fmt.Fprintf(w, "/admin/driver/%s/document", c.GetPathVar("driverId"))
}

func AdminDriverDocumentComplete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	document := service.FindOneDocument(r.FormValue("id"))
	document.Data = r.FormValue("data")
	document.Complete = true
	service.SaveDocument(document)
	c.SetFlash("alertSuccess", "Successfully completed document")
	fmt.Fprintf(w, "/admin/driver/%s/document", c.GetPathVar("driverId"))
}

func AdminDriverDocumentDelete(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "employee", "developer") {
		return
	}
	service.DeleteDocument(c.GetPathVar("documentId"))
	c.SetFlash("alertSuccess", "Successfully deleted document")
	http.Redirect(w, r, "/admin/driver/"+c.GetPathVar("driverId")+"/document", 303)
}
