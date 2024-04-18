package handler

import (
	"context"
	"net/http"
	db "writable-go/db/sqlc"

	"github.com/go-chi/jwtauth"
)

type key int

const (
	StoreKey key = iota
	JwtKey
)

func ProvideStore(store *db.Store) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()
			newCtx := context.WithValue(ctx, StoreKey, store)
			next.ServeHTTP(w, r.WithContext(newCtx))
		})
	}
}

func ProvideJWTAuth(tokenAuth *jwtauth.JWTAuth) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()
			newCtx := context.WithValue(ctx, JwtKey, tokenAuth)
			next.ServeHTTP(w, r.WithContext(newCtx))
		})
	}
}