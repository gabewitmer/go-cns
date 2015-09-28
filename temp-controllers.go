package main

/*
func GetCompBySlug(slug string, ptr interface{}) bool {
	for _, company := range *db.GetStore("company") {
		if company.(map[string]interface{})["Slug"] == slug {
			b, err := json.Marshal(company)
			if err != nil {
				log.Fatal(err)
			}
			if err := json.Unmarshal(b, &ptr); err != nil {
				log.Fatal(err)
			}
			return true
		}
	}
	return false
}

func GetDriverAge(dob int64) int32 {
	diff := time.Now().UnixNano() - dob
	return int32(math.Floor((float64(diff) / float64(1000) / float64(1000) / float64(1000) / float64(60) / float64(60) / float64(24) / float64(365.25))))
}

func GetDriverFromLogin(email, password, companyId string, ptr interface{}) bool {
	var userId string
	for _, user := range *db.GetStore("user") {
		if user.(map[string]interface{})["Email"] == email && user.(map[string]interface{})["Password"] == password && user.(map[string]interface{})["Active"] == true {
			userId = user.(map[string]interface{})["Id"].(string)
			break
		}
	}
	if userId == "" {
		return false
	}
	for _, driver := range *db.GetStore("driver") {
		if driver.(map[string]interface{})["UserId"] == userId && driver.(map[string]interface{})["CompanyId"] == companyId {
			b, err := json.Marshal(driver)
			if err != nil {
				log.Fatal(err)
			}
			if err := json.Unmarshal(b, &ptr); err != nil {
				log.Fatal(err)
			}
			return true
		}
	}
	return false
}

func GetDriverDocuments(driverId string) []interface{} {
	var docs []interface{}
	for _, document := range *db.GetStore("document") {
		//fmt.Printf("doc driver Id: %s", )
		if document.(map[string]interface{})["Complete"] == false && document.(map[string]interface{})["DriverId"] == driverId {
			docs = append(docs, document)
		}
	}
	return docs
}

func CanUpdate(id, email string) bool {
	for _, user := range *db.GetStore("user") {
		if user.(map[string]interface{})["Id"] != id && user.(map[string]interface{})["Email"] == email {
			return false
		}
	}
	return true
}

func FormatDate(date string) string {
	ds := web.SliceString(date, '-')
	return fmt.Sprintf("%s/%s/%s", ds[1], ds[2], ds[0])
}
*/
