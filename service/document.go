package service

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
