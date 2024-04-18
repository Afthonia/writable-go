-- name: CreateUser :one
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
) RETURNING *;