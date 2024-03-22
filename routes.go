package main

import (
	db "writable-go/db/sqlc"

	"github.com/go-chi/chi"
	"github.com/go-chi/jwtauth"
)

func createAPIRoutes(store *db.Store, tokenAuth *jwtauth.JWTAuth) *chi.Mux {
	r := chi.NewMux()

	//r.Use(handler.ProvideStore(store), handler.ProvideJWTAuth(tokenAuth), jwtauth.Verifier(tokenAuth))

	r.Get("/", nil)

	return r
}
