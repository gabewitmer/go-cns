package service
import "net/url"
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
