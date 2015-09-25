package service

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

func DeleteDriver(id string) {
	db.Del("driver", id)
}
