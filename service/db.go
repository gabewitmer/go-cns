package service

import (
	"encoding/json"
	"log"
	"github.com/cagnosolutions/mockdb"
)

type DB interface {
	GetStore(string) *map[string]interface{}
	Add(string, interface{}) string
	Set(string, string, interface{})
	GetAllStores(string) map[string]*map[string]interface{}
	Get(string, string) interface{}
	GetAs(string, string, interface{}) bool
	Del(string, string)
	DelStore(string)
	Query(string, map[string]interface{}, interface{}) bool
	QueryAll(string, map[string]interface{}, interface{}) (int, bool)
	Save()
	Load()
}

var db DB

func init() {
	db = mockdb.NewMockDB("backup.json", 5)
}

func Morph(val, ptr interface{}) {
	b, err := json.Marshal(val)
	if err != nil {
		log.Fatal(err)
	}
	if err := json.Unmarshal(b, &ptr); err != nil {
		log.Fatal(err)
	}
}
/*
db.Set("user", "one", User{
	Id:       "one",
	Email:    "employeeone@cns.com",
	Password: "one",
	Role:     "employee",
	Active:   true,
})
db.Set("user", "two", User{
	Id:       "two",
	Email:    "employeetwo@cns.com",
	Password: "two",
	Role:     "employee",
	Active:   true,
})
db.Set("user", "three", User{
	Id:       "three",
	Email:    "employeethree@cns.com",
	Password: "three",
	Role:     "employee",
	Active:   true,
})
db.Set("user", "four", User{
	Id:       "four",
	Email:    "comapnyeone@cns.com",
	Password: "one",
	Role:     "company",
	Active:   true,
})
db.Set("user", "five", User{
	Id:       "five",
	Email:    "companytwo@cns.com",
	Password: "two",
	Role:     "company",
	Active:   true,
})
db.Set("user", "six", User{
	Id:       "six",
	Email:    "companysix@cns.com",
	Password: "three",
	Role:     "company",
	Active:   true,
})
db.Set("user", "seven", User{
	Id:       "seven",
	Email:    "driverone@cns.com",
	Password: "one",
	Role:     "driver",
	Active:   true,
})
db.Set("user", "eight", User{
	Id:       "eight",
	Email:    "drivertwo@cns.com",
	Password: "two",
	Role:     "driver",
	Active:   true,
})
db.Set("user", "nine", User{
	Id:       "nine",
	Email:    "driverthree@cns.com",
	Password: "three",
	Role:     "driver",
	Active:   true,
})
db.Set("user", "ten", User{
	Id:       "ten",
	Email:    "admin@cns.com",
	Password: "admin",
	Role:     "admin",
	Active:   true,
})
db.Set("employee", "one", Employee{
	Id:        "one",
	FirstName: "John",
	LastName:  "Smith",
	Street:    "1313 Mocking Bird Lane",
	City:      "Lancaster",
	State:     "PA",
	Zip:       "17603",
	Email:     "employeeone@cns.com",
	UserId:    "one",
})
db.Set("employee", "two", Employee{
	Id:        "two",
	FirstName: "Jone",
	LastName:  "Doe",
	Street:    "13 Crutfield dr",
	City:      "Lancaster",
	State:     "PA",
	Zip:       "17603",
	Email:     "employeetwo@cns.com",
	UserId:    "two",
})
db.Set("employee", "two", Employee{
	Id:        "three",
	FirstName: "Sam",
	LastName:  "Sparks",
	Street:    "1562 Willoe Road",
	City:      "Lancaster",
	State:     "PA",
	Zip:       "17603",
	Email:     "employeethree@cns.com",
	UserId:    "three",
})

db.Set("employee", "three", Employee{
	Id:        "four",
	FirstName: "Admin",
	LastName:  "Admin",
	Street:    "1 Admin Road",
	City:      "Lancaster",
	State:     "PA",
	Zip:       "17603",
	Email:     "admin@cns.com",
	UserId:    "ten",
})
db.Set("company", "one", Company{
	Id:             "one",
	Name:           "Company One",
	Street:         "1 Company drive",
	City:           "Lititz",
	State:          "PA",
	Zip:            "17545",
	Slug:           "company-one",
	AgeRequirement: 18,
	Logo:           false,
	Feature:        true,
	UserId:         "four",
})
db.Set("company", "two", Company{
	Id:             "two",
	Name:           "Company Two",
	Street:         "2 Company drive",
	City:           "Lancaster",
	State:          "PA",
	Zip:            "17603",
	Slug:           "company-two",
	AgeRequirement: 21,
	Logo:           false,
	Feature:        true,
	UserId:         "five",
})
db.Set("company", "three", Company{
	Id:             "three",
	Name:           "Company Three",
	Street:         "3 Company drive",
	City:           "Ephrata",
	State:          "PA",
	Zip:            "17543",
	Slug:           "company-three",
	AgeRequirement: 16,
	Logo:           false,
	Feature:        false,
	UserId:         "six",
})
db.Set("driver", "one", Driver{
	Id:        "one",
	FirstName: "Greg",
	LastName:  "Pechiro",
	Street:    "21 Quaker Hills Rd",
	City:      "Lancaster",
	State:     "PA",
	Zip:       "17603",
	Email:     "driverone@cns.com",
	DOB:       "",
	Status:    0,
	UserId:    "seven",
	CompanyId: "one",
})
db.Set("driver", "two", Driver{
	Id:        "two",
	FirstName: "Scotty",
	LastName:  "Cagno",
	Street:    "128 Pleasant View Dr",
	City:      "Lititz",
	State:     "PA",
	Zip:       "17543",
	Email:     "drivertwo@cns.com",
	DOB:       "",
	Status:    0,
	UserId:    "eight",
	CompanyId: "two",
})
db.Set("driver", "three", Driver{
	Id:        "three",
	FirstName: "Gabe",
	LastName:  "Witmer",
	Street:    "2 Industrial Dr",
	City:      "Ephrata",
	State:     "PA",
	Zip:       "17543",
	Email:     "driverthree@cns.com",
	DOB:       "",
	Status:    0,
	UserId:    "nine",
	CompanyId: "three",
})
*/
