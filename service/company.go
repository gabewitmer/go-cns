package service

import (
	"net/url"
	"strconv"
	"strings"
)

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

func (c * Company) GenerateSlug() {
	// TODO: add better sanitization
	c.Slug = strings.ToLower(strings.Replace(c.Name, " ", "-", -1))
}

func FindAllCompany() []Company {
	var companys []Company
	for _, c := range *db.GetStore("company") {
		var company Company
		Morph(c, &company)
		companys = append(companys, company)
	}
	return companys
}

func FindOneCompany(id string) Company {
	var company Company
	db.GetAs("company", id, &company)
	return company
}

func FindOneCompanyBySlug(slug string) (Company, bool) {
	var company Company
	ok := db.Query("company", map[string]interface{}{"Slug": slug}, &company)
	return company, ok
}

func SaveCompany(company Company) {
	company.GenerateSlug()
	db.Set("company", company.Id, company)
}

func DeleteCompany(id string) {
	var company Company
	db.GetAs("company", id, &company)
	db.Del("user", company.UserId)
	db.Del("company", id)
}

func MakeCompany(dat url.Values) Company {
	company := Company{
		Id:     dat.Get("companyId"),
		Name:   dat.Get("name"),
		Street: dat.Get("street"),
		City:   dat.Get("city"),
		State:  dat.Get("state"),
		Zip:    dat.Get("zip"),
		Slug:   dat.Get("email"),
		UserId: dat.Get("userId"),
	}
	l, _ := strconv.ParseBool(dat.Get("logo"))
	f, _ := strconv.ParseBool(dat.Get("feature"))
	a, _ := strconv.Atoi(dat.Get("ageRequirement"))
	company.Logo = l
	company.Feature = f
	company.AgeRequirement = int32(a)
	return company
}
