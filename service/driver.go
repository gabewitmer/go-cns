package service

import (
	"fmt"
	"math"
	"net/url"
	"time"

	"github.com/cagnosolutions/web/util"
)

type Driver struct {
	Id        string
	FirstName string
	LastName  string
	Street    string
	City      string
	State     string
	Zip       string
	Email     string
	DOB       string
	Status    int8 // o = unqualified, 1 = pending, 2 = denied, 3 = active, 4 = suspended
	UserId    string
	CompanyId string
}

func FindAllDriver() []Driver {
	var drivers []Driver
	for _, v := range *db.GetStore("driver") {
		var driver Driver
		Morph(v, driver)
		drivers = append(drivers, driver)
	}
	return drivers
}

func FindOneDriver(id string) Driver {
	var driver Driver
	db.GetAs("driver", id, &driver)
	return driver
}

func SaveDriver(driver Driver) {
	db.Set("driver", driver.Id, driver)
}

func FindOneDriverByCompanyLogin(email, password, companyId string) (Driver, bool) {
	var user User
	var driver Driver
	ok := db.Query("user", map[string]interface{}{"Email": email, "Password": password, "Role": "driver", "Active": true}, &user)
	if ok {
		ok = db.Query("driver", map[string]interface{}{"UserId": user.Id, "companyId": companyId}, &driver)
	}
	return driver, ok

}

func DeleteDriver(id string) {
	var driver Driver
	db.GetAs("driver", id, &driver)
	db.Del("user", driver.UserId)
	db.Del("driver", id)
}

func MakeDriver(dat url.Values) Driver {
	//driver := Driver{
	//	Id:        dat.Get("driverId"),
	//	FirstName: dat.Get("firstName"),
	//	LastName:  dat.Get("lastName"),
	//	Street:    dat.Get("street"),
	//	City:      dat.Get("city"),
	//	State:     dat.Get("state"),
	//	Zip:       dat.Get("zip"),
	//	Email:     dat.Get("email"),
	//	DOB:       formatDate(dat.Get("dob")),
	//	UserId:    dat.Get("userId"),
	//	CompanyId: dat.Get("companyId"),
	//}
	//s, _ := strconv.Atoi(dat.Get("status"))
	//driver.Status = int8(s)
	var driver Driver
	util.FormToStruct(&driver, dat, "")
	return driver
}

func NewDriver(dat url.Values) (Driver, User) {
	user := User{
		Id:       util.UUID4(),
		Email:    dat.Get("email"),
		Password: dat.Get("email"),
		Role:     "driver",
		Active:   true,
	}
	var driver Driver
	util.FormToStruct(&driver, dat, "")
	driver.Id = util.UUID4()
	driver.UserId = user.Id
	return driver, user
}

func FindAllDriverByCompany(companyId string) []Driver {
	var drivers []Driver
	db.QueryAll("driver", map[string]interface{}{"CompanyId": companyId}, &drivers)
	return drivers
}

func formatDate(date string) string {
	ds := util.SliceString(date, '-')
	return fmt.Sprintf("%s/%s/%s", ds[1], ds[2], ds[0])
}

func GetDriverAge(dob int64) int32 {
	diff := time.Now().UnixNano() - dob
	return int32(math.Floor((float64(diff) / float64(1000) / float64(1000) / float64(1000) / float64(60) / float64(60) / float64(24) / float64(365.25))))
}
