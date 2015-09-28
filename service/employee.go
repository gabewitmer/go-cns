package service

import (
	"net/url"

	"github.com/cagnosolutions/web/util"
)

type Employee struct {
	Id        string
	FirstName string
	LastName  string
	Street    string
	City      string
	State     string
	Zip       string
	Email     string
	UserId    string
}

func FindAllEmployee() []Employee {
	var employees []Employee
	for _, v := range *db.GetStore("employee") {
		var employee Employee
		Morph(v, employee)
		employees = append(employees, employee)
	}
	return employees
}

func FindOneEmployee(id string) Employee {
	var employee Employee
	db.GetAs("employee", id, &employee)
	return employee
}

func FindOneEmployeeByLogin(email, password string) (Employee, string, bool) {
	var employee Employee
	var user User
	ok := db.Query("user", map[string]interface{}{"Email": email, "Password": password, "Active": true}, &user)
	if ok && (user.Role == "admin" || user.Role == "employee") {
		ok = db.Query("employee", map[string]interface{}{"UserId": user.Id}, &employee)
	}
	return employee, user.Role, ok
}

func SaveEmployee(employee Employee) {
	db.Set("employee", employee.Id, employee)
}

func DeleteEmployee(id string) {
	var e Employee
	db.GetAs("employee", id, &e)
	db.Del("user", e.UserId)
	db.Del("employee", id)
}

func MakeEmployee(dat url.Values) Employee {
	return Employee{
		Id:        dat.Get("employeeId"),
		FirstName: dat.Get("firstName"),
		LastName:  dat.Get("lastName"),
		Street:    dat.Get("street"),
		City:      dat.Get("city"),
		State:     dat.Get("state"),
		Zip:       dat.Get("zip"),
		Email:     dat.Get("email"),
		UserId:    dat.Get("userId"),
	}
}

func NewEmployee(dat url.Values) (Employee, User) {
	user := User{
		Id:       util.UUID4(),
		Email:    dat.Get("email"),
		Password: dat.Get("email"),
		Role:     "driver",
		Active:   true,
	}
	employee := MakeEmployee(dat)
	employee.Id = util.UUID4()
	employee.UserId = user.Id
	return employee, user
}
