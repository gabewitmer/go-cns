package service

type Comment struct {
	Id     string
	Com    string
	Url    string
	Name   string
	Closed bool
}

func FindAllComment() []Comment {
	var comments []Comment
	for _, v := range *db.GetStore("comment") {
		var comment Comment
		Morph(v, &comment)
		comments = append(comments, comment)
	}
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
