package service

import "sort"

type Comment struct {
	Id     string
	Com    string
	Url    string
	Name   string
	Closed bool
}

type Comments []Comment

func (c Comments) Len() int {
	return len(c)
}

func (c Comments) Less(i, j int) bool {
	return c[i].Id < c[j].Id
}

func (c Comments) Swap(i, j int) {
	ie := c[i]
	je := c[j]
	c[i] = je
	c[j] = ie
}

func FindAllComment() Comments {
	var comments Comments
	for _, v := range *db.GetStore("comment") {
		var comment Comment
		Morph(v, &comment)
		comments = append(comments, comment)
	}
	sort.Stable(sort.Reverse(comments))
	return comments
}

func FindOneComment(id string) Comment {
	var comment Comment
	db.GetAs("comment", id, &comment)
	return comment
}

func SaveComment(comment Comment) {
	db.Set("comment", comment.Id, comment)
}

func DeleteComment(id string) {
	var comment Comment
	db.GetAs("comment", id, &comment)
	db.Del("comment", id)
}
