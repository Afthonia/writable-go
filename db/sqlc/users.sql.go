// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: users.sql

package db

import (
	"context"
	"database/sql"
)

const createUser = `-- name: CreateUser :one
INSERT INTO users (
    permgroup_id,
    name,
    middle_name,
    surname,
    username,
    email,
    password_hash,
    gender_id,
    inspiration_id,
    level_id,
    title_id,
    author_type_id,
    bio,
    favorite_author,
    favorite_book
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15
) RETURNING id, permgroup_id, name, middle_name, surname, username, email, password_hash, gender_id, inspiration_id, level_id, title_id, author_type_id, bio, favorite_author, favorite_book, last_visited, created_at
`

type CreateUserParams struct {
	PermgroupID    int32          `json:"permgroup_id"`
	Name           string         `json:"name"`
	MiddleName     sql.NullString `json:"middle_name"`
	Surname        sql.NullString `json:"surname"`
	Username       string         `json:"username"`
	Email          string         `json:"email"`
	PasswordHash   string         `json:"password_hash"`
	GenderID       int16          `json:"gender_id"`
	InspirationID  int16          `json:"inspiration_id"`
	LevelID        int16          `json:"level_id"`
	TitleID        int16          `json:"title_id"`
	AuthorTypeID   int16          `json:"author_type_id"`
	Bio            sql.NullString `json:"bio"`
	FavoriteAuthor sql.NullString `json:"favorite_author"`
	FavoriteBook   sql.NullString `json:"favorite_book"`
}

func (q *Queries) CreateUser(ctx context.Context, arg CreateUserParams) (User, error) {
	row := q.db.QueryRowContext(ctx, createUser,
		arg.PermgroupID,
		arg.Name,
		arg.MiddleName,
		arg.Surname,
		arg.Username,
		arg.Email,
		arg.PasswordHash,
		arg.GenderID,
		arg.InspirationID,
		arg.LevelID,
		arg.TitleID,
		arg.AuthorTypeID,
		arg.Bio,
		arg.FavoriteAuthor,
		arg.FavoriteBook,
	)
	var i User
	err := row.Scan(
		&i.ID,
		&i.PermgroupID,
		&i.Name,
		&i.MiddleName,
		&i.Surname,
		&i.Username,
		&i.Email,
		&i.PasswordHash,
		&i.GenderID,
		&i.InspirationID,
		&i.LevelID,
		&i.TitleID,
		&i.AuthorTypeID,
		&i.Bio,
		&i.FavoriteAuthor,
		&i.FavoriteBook,
		&i.LastVisited,
		&i.CreatedAt,
	)
	return i, err
}