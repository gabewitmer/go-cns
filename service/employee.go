package service

import (
	"net/url"
	"sort"
	"strconv"

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

type Employees []Employee

func (e Employees) Len() int {
	return len(e)
}

func (e Employees) Less(i, j int) bool {
	return e[i].Id < e[j].Id
}

func (e Employees) Swap(i, j int) {
	ie := e[i]
	je := e[j]
	e[i] = je
	e[j] = ie
}

func FindAllEmployee() Employees {
	var employees Employees
	for _, v := range *db.GetStore("employee") {
		var employee Employee
		Morph(v, &employee)
		employees = append(employees, employee)
	}
	sort.Stable(sort.Reverse(employees))
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
	var employee Employee
	db.GetAs("employee", id, &employee)
	db.Del("user", employee.UserId)
	db.Del("employee", id)
}

/*func MakeEmployee(dat url.Values) Employee {
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
}*/

func NewEmployee(dat url.Values) (Employee, User) {
	user := User{
		Id:       util.UUID4(),
		Email:    dat.Get("email"),
		Password: dat.Get("email"),
		Role:     dat.Get("role"),
	}
	a, _ := strconv.ParseBool(dat.Get("active"))
	user.Active = a
	var employee Employee
	util.FormToStruct(&employee, dat, "")
	employee.Id = util.UUID4()
	employee.UserId = user.Id
	return employee, user
}
