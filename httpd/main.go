package main

import (
	"database/sql"
	"log"
	"net/http"
	db "writable-go/db/sqlc"

	"github.com/go-chi/jwtauth"
)

func main() {

	store := createStore()

	tokenAuth := jwtauth.New("HS256", []byte("123456"), nil)

	r := createAPIRoutes(store, tokenAuth)

	log.Println("Server Başlatıldı")
	// http = 80
	// https = 443

	if err := http.ListenAndServe(":8081", r); err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

func createStore() *db.Store {
	dbConn, err := sql.Open("postgres", "postgresql://ayse:123456@localhost:5432/trendy_blog?sslmode=disable")
	if err != nil {
		log.Fatalf("error creating database : %v \n", err)
	}

	dbConn.SetMaxIdleConns(20)
	dbConn.SetMaxOpenConns(100)

	return db.NewStore(dbConn)
}