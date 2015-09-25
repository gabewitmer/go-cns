package service

import (
	"net/url"
	"strconv"
)

type User struct {
	Id       string
	Email    string
	Password string
	Role     string
	Active   bool
}

func FindAllUser() []User {
	var users []User
	for _, v := range *db.GetStore("user") {
		var user User
		Morph(v, user)
		users = append(users, user)
	}
	return users
}

func FindOneUser(id string) User {
	var user User
	db.GetAs("user", id, &user)
	return user
}

func SaveUser(user User) {
	db.Set("user", user.Id, user)
}

func DeleteUser(id string) {
	db.Del("user", id)
}

func MakeUser(dat url.Values) User {
	user := User{
		Id:       dat.Get("userId"),
		Email:    dat.Get("email"),
		Password: dat.Get("password"),
		Role:     dat.Get("role"),
	}
	a, _ := strconv.ParseBool(dat.Get("active"))
	user.Active = a
	return user
}

func CanUpdate(id, email string) bool {
	var users []User
	n, _ :=db.QueryAll("user", map[string]interface{}{"id": id, "email":email}, users)
	switch n {
	case 0:
		return true
	case 1:
		return id == users[0].Id
	default:
		return false
	}
}
