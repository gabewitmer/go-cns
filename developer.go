package main

import (
	"net/http"
	"strconv"

	"github.com/cagnosolutions/web"
	"github.com/cagnosolutions/web/tmpl"
	"github.com/gabewitmer/go-cns/service"
)

func DeveloperRoutes(mux *web.Mux) {

	mux.Get("/dev/comment", DevComments)
	mux.Get("/dev/comment/:id", DevCommentSave)
}

func DevComments(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "developer") {
		return
	}
	msgK, msgV := c.GetFlash()
	ts.Render(w, "dev-comments.tmpl", tmpl.Model{
		msgK:       msgV,
		"comments": service.FindAllComment(),
	})
}

func DevCommentSave(w http.ResponseWriter, r *http.Request, c *web.Context) {
	if !c.CheckAuth(w, r, "/login", "admin", "developer") {
		return
	}
	comment := service.FindOneComment(c.GetPathVar("id"))
	closed, _ := strconv.ParseBool(r.FormValue("closed"))
	comment.Closed = closed
	service.SaveComment(comment)
	http.Redirect(w, r, "/dev/comment", 303)
}
