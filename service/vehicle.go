package service

import "sort"

type Vehicle struct {
	Id        string
	Name      string
	Type      int
	CompanyId string
}

type Vehicles []Vehicle

func (v Vehicles) Len() int {
	return len(v)
}

func (v Vehicles) Less(i, j int) bool {
	return v[i].Id < v[j].Id
}

func (v Vehicles) Swap(i, j int) {
	ie := v[i]
	je := v[j]
	v[i] = je
	v[j] = ie
}

func FindAllVehicle() Vehicles {
	var vehicles Vehicles
	for _, v := range *db.GetStore("vehicle") {
		var vehicle Vehicle
		Morph(v, &vehicle)
		vehicles = append(vehicles, vehicle)
	}
	sort.Stable(sort.Reverse(vehicles))
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

func FindAllVehicleByCompany(companyId string) []Vehicle {
	var vehicles []Vehicle
	db.QueryAll("vehicle", map[string]interface{}{"CompanyId": companyId}, &vehicles)
	return vehicles
}

/*func MakeVehicle(dat url.Values) Vehicle {
	vehicle := Vehicle{
		Id:        dat.Get("vehicleId"),
		Name:      dat.Get("name"),
		CompanyId: dat.Get("companyId"),
	}
	t, _ := strconv.Atoi(dat.Get("type"))
	vehicle.Type = t
	if vehicle.Id == "" {
		vehicle.Id = util.UUID4()
	}
	return vehicle
}*/
