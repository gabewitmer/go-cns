package service

import (
	"net/url"
	"strconv"
)

type Document struct {
	Id         string
	Name       string
	DocumentId string
	Complete   bool
	Data       string
	CompanyId  string
	DriverId   string
}

var DQFS = [][]string{
	[]string{"100", "Driver's Application"},
	[]string{"180", "Certification of Violations"},
	//[]string{"200", "Annual Inquery & Review"},
	//[]string{"250", "Road Test Certication"},
	[]string{"300", "Previous Driver Inquires"},
	[]string{"400", "Drug & Alcohol Records Request"},
	//[]string{"450", "Drug & Alcohol Certified Receipt"},
	[]string{"500", "Certification Compliance"},
	[]string{"600", "Confictions for a Driver Violation"},
	[]string{"700", "New Hire Stmt On Duty Hours"},
	[]string{"750", "Other Ompensated Work"},
	[]string{"775", "Fair Credit Reporting Act"},
}

func FindAllDocument() []Document {
	var documents []Document
	for _, v := range *db.GetStore("document") {
		var document Document
		Morph(v, document)
		documents = append(documents, document)
	}
	return documents
}

func FindAllDocumentByDriver(driverId string) []Document {
	var documents []Document
	db.QueryAll("document", map[string]interface{}{"DriverId": driverId}, &documents)
	return documents
}

func FindAllIncompleteDocumentByDriver(driverId string) []Document {
	var documents []Document
	db.QueryAll("document", map[string]interface{}{"DriverId": driverId, "Complete": false}, &documents)
	return documents
}

func FindOneDocument(id string) Document {
	var document Document
	db.GetAs("document", id, &document)
	return document
}

func SaveDocument(document Document) {
	db.Set("document", document.Id, document)
}

func DeleteDocument(id string) {
	db.Del("document", id)
}

func MakeDocument(dat url.Values) Document {
	document := Document{
		Id:         dat.Get("documentId"),
		Name:       dat.Get("name"),
		DocumentId: dat.Get("docId"),
		Data:       dat.Get("data"),
		CompanyId:  dat.Get("companyId"),
		DriverId:   dat.Get("driverId"),
	}
	c, _ := strconv.ParseBool(dat.Get("complete"))
	document.Complete = c
	return document
}
