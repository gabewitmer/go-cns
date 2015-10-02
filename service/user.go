package service

import "sort"

type User struct {
	Id       string
	Email    string
	Password string
	Role     string
	Active   bool
}

type Users []User

func (u Users) Len() int {
	return len(u)
}

func (u Users) Less(i, j int) bool {
	return u[i].Id < u[j].Id
}

func (u Users) Swap(i, j int) {
	ie := u[i]
	je := u[j]
	u[i] = je
	u[j] = ie
}

func FindAllUser() Users {
	var users Users
	for _, v := range *db.GetStore("user") {
		var user User
		Morph(v, &user)
		users = append(users, user)
	}
	sort.Stable(sort.Reverse(users))
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

/*func MakeUser(dat url.Values) User {
	user := User{
		Id:       dat.Get("userId"),
		Email:    dat.Get("email"),
		Password: dat.Get("password"),
		Role:     dat.Get("role"),
	}
	a, _ := strconv.ParseBool(dat.Get("active"))
	user.Active = a
	return user
}*/

func UserRoles() map[string]string {
	m := make(map[string]string)
	for _, v := range *db.GetStore("user") {
		m[v.(map[string]interface{})["Id"].(string)] = v.(map[string]interface{})["Role"].(string)
	}
	return m
}

func CanUpdate(id, email string) bool {
	var users []User
	n, _ := db.QueryAll("user", map[string]interface{}{"Email": email}, &users)
	switch n {
	case 0:
		return true
	case 1:
		return id == users[0].Id
	default:
		return false
	}
}
