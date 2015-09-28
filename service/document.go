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
