package main

type DB interface {
	GetStore(string) *map[string]interface{}
	Add(string, interface{}) string
	Set(string, string, interface{})
	GetAllStores(string) map[string]*map[string]interface{}
	Get(string, string) interface{}
	GetAs(string, string, interface{}) bool
	Del(string, string)
	DelStore(string)
	Save()
	Load()
}

type User struct {
	Id       string `json:",omitempty"`
	Email    string `json:",omitempty"`
	Password string `json:",omitempty"`
	Role     string `json:",omitempty"`
	Active   bool   `json:",omitempty"`
}

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

type Company struct {
	Id             string
	Name           string
	Street         string
	City           string
	State          string
	Zip            string
	Slug           string
	AgeRequirement int32
	Logo           bool
	Feature        bool
	UserId         string
}

type Driver struct {
	Id        string
	FirstName string
	LastName  string
	Street    string
	City      string
	State     string
	Zip       string
	Email     string
	DOB       int64
	Status    int8
	UserId    string
	CompanyId string
}

type Vehicle struct {
	Id        string
	Name      string
	Type      int
	CompanyId string
}
