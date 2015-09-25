package service

type Vehicle struct {
	Id        string
	Name      string
	Type      int
	CompanyId string
}

func FindAllVehicle() []Vehicle {
	var vehicles []Vehicle
	for _, v := range *db.GetStore("vehicle") {
		var vehicle Vehicle
		Morph(v, vehicle)
		vehicles = append(vehicles, vehicle)
	}
	return vehicles
}

func FindOneVehicle(id string) Vehicle {
	var vehicle Vehicle
	db.GetAs("vehicle", id, &vehicle)
	return vehicle
}

func SaveVehicle(vehicle Vehicle) {
	db.Set("vehicle", vehicle.Id, vehicle)
}

func DeleteVehicle(id string) {
	db.Del("vehicle", id)
}
