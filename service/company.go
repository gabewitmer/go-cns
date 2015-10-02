package service

import (
	"sort"
	"strings"
)

type Companies []Company

func (c Companies) Len() int {
	return len(c)
}

func (c Companies) Less(i, j int) bool {
	return c[i].Id < c[j].Id
}

func (c Companies) Swap(i, j int) {
	ie := c[i]
	je := c[j]
	c[i] = je
	c[j] = ie
}

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

func (c *Company) GenerateSlug() {
	// TODO: add better sanitization
	c.Slug = strings.ToLower(strings.Replace(c.Name, " ", "-", -1))
}

func FindAllCompany() Companies {
	var companies Companies
	for _, c := range *db.GetStore("company") {
		var company Company
		Morph(c, &company)
		companies = append(companies, company)
	}
	sort.Stable(sort.Reverse(companies))
	return companies
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

func GetVehicleCount(companyId string) int {
	return len(FindAllVehicleByCompany(companyId))
}

func GetDriverCount(companyId string) int {
	return len(FindAllDriverByCompany(companyId))
}

func CompanyNames() map[string]string {
	m := make(map[string]string)
	for _, c := range *db.GetStore("company") {
		m[c.(map[string]interface{})["Id"].(string)] = c.(map[string]interface{})["Name"].(string)
	}
	return m
}

/*func MakeCompany(dat url.Values) Company {
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
}*/
