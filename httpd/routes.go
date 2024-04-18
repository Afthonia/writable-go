package main

import (
	"time"
	db "writable-go/db/sqlc"
	"writable-go/httpd/handler"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/jwtauth"
)

func createAPIRoutes(store *db.Store, tokenAuth *jwtauth.JWTAuth) *chi.Mux {
	r := chi.NewMux()

	r.Use(handler.ProvideStore(store), handler.ProvideJWTAuth(tokenAuth), jwtauth.Verifier(tokenAuth))

	r.Use(middleware.RequestID)
	r.Use(middleware.RealIP)
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
	r.Use(middleware.Timeout(60 * time.Second))

	r.Get("/", nil)

	return r
}
