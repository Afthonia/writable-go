INSERT INTO permgroups (id, name, permissions) VALUES (1, user, '{"ManageBook","CreateBook"}');

INSERT INTO genders (id, gender_name) VALUES (1, 'female');
INSERT INTO genders (id, gender_name) VALUES (2, 'male');
INSERT INTO genders (id, gender_name) VALUES (3, 'other');

INSERT INTO inspirations (id, insp_name) VALUES (1, 'professional');
INSERT INTO inspirations (id, insp_name) VALUES (2, 'hobby');
INSERT INTO inspirations (id, insp_name) VALUES (3, 'for fun');

INSERT INTO author_levels (id, level_name) VALUES (1, 'rookie');
INSERT INTO author_levels (id, level_name) VALUES (2, 'promising');
INSERT INTO author_levels (id, level_name) VALUES (3, 'best-seller');

-- INSERT INTO genres (id, genre_name) VALUES (1, 'horror');
-- INSERT INTO genres (id, genre_name) VALUES (2, 'romance');
-- INSERT INTO genres (id, genre_name) VALUES (3, 'adventure');
-- INSERT INTO genres (id, genre_name) VALUES (4, 'self-care');
-- INSERT INTO genres (id, genre_name) VALUES (5, 'fantasy');

INSERT INTO author_titles (id, title) VALUES (1, 'crazy romantic');
INSERT INTO author_titles (id, title) VALUES (2, 'ink master');
INSERT INTO author_titles (id, title) VALUES (3, 'story weaver');
INSERT INTO author_titles (id, title) VALUES (4, 'novel architect');
INSERT INTO author_titles (id, title) VALUES (5, 'imagination maestro');

INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (1, 1, 'user1', 'username1', 'mail1', 'vdsbvjds', 1, 1, 1, 1);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (2, 1, 'user2', 'username2', 'mail2', 'vmkvnsdf', 2, 2, 1, 3);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (3, 1, 'user3', 'username3', 'mail3', 'vsndkjvds', 3, 2, 1, 2);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (4, 1, 'user4', 'username4', 'mail4', 'vvdsdskjv', 2, 2, 1, 4);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (5, 1, 'user5', 'username5', 'mail5', 'vsdknv', 2, 2, 2, 5);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (6, 1, 'user6', 'username6', 'mail6', 'gıorghtn', 1, 3, 1, 2);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (7, 1, 'user7', 'username7', 'mail7', 'khptnbfk', 1, 3, 1, 2);
INSERT INTO users (id, permgroup_id, name, username, email, password_hash, gender_id, inspiration_id, level_id, title_id) VALUES (8, 1, 'user8', 'username8', 'mail8', 'gfyegfgfrh', 1, 3, 3, 2);

INSERT INTO quotes (user_id, quote, author) VALUES (1, 'quote1', 'auth1');
INSERT INTO quotes (user_id, quote, author) VALUES (2, 'quote2', 'auth2');
INSERT INTO quotes (user_id, quote, author) VALUES (5, 'quote3', 'auth2');
INSERT INTO quotes (user_id, quote, author) VALUES (4, 'quote4', 'auth1');
INSERT INTO quotes (user_id, quote, author) VALUES (6, 'quote5', 'auth1');
INSERT INTO quotes (user_id, quote, author) VALUES (3, 'quote6', 'auth4');
INSERT INTO quotes (user_id, quote, author) VALUES (4, 'quote7', 'auth3');
INSERT INTO quotes (user_id, quote, author) VALUES (8, 'quote8', 'auth6');
INSERT INTO quotes (user_id, quote, author) VALUES (5, 'quote9', 'auth2');
INSERT INTO quotes (user_id, quote, author) VALUES (5, 'quote10', 'auth4');

INSERT INTO follows (follower_id, following_id) VALUES (1, 3) ON CONFLICT(following_id, follower_id) DO UPDATE SET is_followed = NOT follows.is_followed;
INSERT INTO follows (follower_id, following_id) VALUES (2, 3) ON CONFLICT(following_id, follower_id) DO UPDATE SET is_followed = NOT follows.is_followed;
INSERT INTO follows (follower_id, following_id) VALUES (4, 5) ON CONFLICT(following_id, follower_id) DO UPDATE SET is_followed = NOT follows.is_followed;
INSERT INTO follows (follower_id, following_id) VALUES (7, 6) ON CONFLICT(following_id, follower_id) DO UPDATE SET is_followed = NOT follows.is_followed;
INSERT INTO follows (follower_id, following_id) VALUES (8, 3) ON CONFLICT(following_id, follower_id) DO UPDATE SET is_followed = NOT follows.is_followed;


INSERT INTO books (author_id, title) VALUES (1, 'title1');
INSERT INTO books (author_id, title) VALUES (8, 'title2');
INSERT INTO books (author_id, title) VALUES (8, 'title3');
INSERT INTO books (author_id, title) VALUES (8, 'title4');
INSERT INTO books (author_id, title) VALUES (8, 'title5');
INSERT INTO books (author_id, title) VALUES (4, 'title6');
INSERT INTO books (author_id, title) VALUES (3, 'title7');
INSERT INTO books (author_id, title) VALUES (2, 'title8');
INSERT INTO books (author_id, title) VALUES (5, 'title9');
INSERT INTO books (author_id, title) VALUES (6, 'title10');


INSERT INTO chapters (book_id, name) VALUES (2, 'ch1');
INSERT INTO chapters (book_id, name) VALUES (4, 'ch2');
INSERT INTO chapters (book_id, name) VALUES (9, 'ch3');
INSERT INTO chapters (book_id, name) VALUES (2, 'ch4');
INSERT INTO chapters (book_id, name) VALUES (1, 'ch5');
INSERT INTO chapters (book_id, name) VALUES (2, 'ch6');
INSERT INTO chapters (book_id, name) VALUES (4, 'ch7');
INSERT INTO chapters (book_id, name) VALUES (2, 'ch8');
INSERT INTO chapters (book_id, name) VALUES (7, 'ch9');
INSERT INTO chapters (book_id, name) VALUES (10, 'ch10');

INSERT INTO characters (book_id, name) VALUES (1, 'character1');
INSERT INTO characters (book_id, name) VALUES (2, 'character2');
INSERT INTO characters (book_id, name) VALUES (5, 'character3');
INSERT INTO characters (book_id, name) VALUES (4, 'character4');
INSERT INTO characters (book_id, name) VALUES (6, 'character5');
INSERT INTO characters (book_id, name) VALUES (3, 'character6');
INSERT INTO characters (book_id, name) VALUES (4, 'character7');
INSERT INTO characters (book_id, name) VALUES (8, 'character8');
INSERT INTO characters (book_id, name) VALUES (5, 'character9');
INSERT INTO characters (book_id, name) VALUES (5, 'character10');

INSERT INTO species (book_id, name) VALUES (1, 'sp1');
INSERT INTO species (book_id, name) VALUES (3, 'sp2');
INSERT INTO species (book_id, name) VALUES (5, 'sp3');
INSERT INTO species (book_id, name) VALUES (10, 'sp4');
INSERT INTO species (book_id, name) VALUES (8, 'sp5');
INSERT INTO species (book_id, name) VALUES (3, 'sp6');

INSERT INTO items (book_id, name) VALUES (1, 'item1');
INSERT INTO items (book_id, name) VALUES (3, 'item2');
INSERT INTO items (book_id, name) VALUES (4, 'item3');
INSERT INTO items (book_id, name) VALUES (2, 'item4');
INSERT INTO items (book_id, name) VALUES (7, 'item5');
INSERT INTO items (book_id, name) VALUES (6, 'item6');

INSERT INTO notes (book_id, name) VALUES (6, 'note1');
INSERT INTO notes (book_id, name) VALUES (2, 'note2');
INSERT INTO notes (book_id, name) VALUES (6, 'note3');
INSERT INTO notes (book_id, name) VALUES (10, 'note4');
INSERT INTO notes (book_id, name) VALUES (4, 'note5');
INSERT INTO notes (book_id, name) VALUES (3, 'note6');

INSERT INTO published_books (book_id, author_id) VALUES (1, 3) ON CONFLICT(book_id, author_id) DO UPDATE SET is_published = NOT published_books.is_published;
INSERT INTO published_books (book_id, author_id) VALUES (2, 3) ON CONFLICT(book_id, author_id) DO UPDATE SET is_published = NOT published_books.is_published;
INSERT INTO published_books (book_id, author_id) VALUES (4, 5) ON CONFLICT(book_id, author_id) DO UPDATE SET is_published = NOT published_books.is_published;
INSERT INTO published_books (book_id, author_id) VALUES (7, 6) ON CONFLICT(book_id, author_id) DO UPDATE SET is_published = NOT published_books.is_published;
INSERT INTO published_books (book_id, author_id) VALUES (8, 3) ON CONFLICT(book_id, author_id) DO UPDATE SET is_published = NOT published_books.is_published;

