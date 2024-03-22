-- name: CreateBook :one
INSERT INTO books (
    author_id,
    title,
    subtitle
) VALUES (
    $1, $2, $3
) RETURNING id, 0::bigint as author_id, '' as author, title, COALESCE(subtitle, '')::text as subtitle, '{}'::text[] as tags, created_at;

-- name: ListBooks :many
SELECT b.id, u.id as author_id, u.username as author, b.title, COALESCE('', b.subtitle)::text as subtitle, t.name, COALESCE(0, c.number)::bigint as chapters, b.created_at, '' as cover_url FROM books b
INNER JOIN users u ON u.id = b.author_id
LEFT JOIN book_tags bt ON bt.book_id = b.id
LEFT JOIN tags t ON t.id = bt.tag_id
LEFT JOIN (SELECT book_id, COUNT(*) as number FROM chapters GROUP BY book_id) c ON c.book_id = b.id
ORDER BY b.created_at DESC;

/* look at later ^^^ */



-- name: DeleteBook :one
DELETE FROM books
WHERE author_id = $1 AND id = $2
RETURNING id;