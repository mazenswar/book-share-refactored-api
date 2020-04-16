# Book Share

## API Design

### Relationships

User --< Donation >-- Book
User --< Purchase >-- Book
User --< Address
Book --< Authors
Book --< Genres
Book --< IdTags
Book --< ImageLinks

### Models

1. User

   - username
   - full_name
   - email
   - password
   - credits, default 0

   rails g resource User username full_name email password_digest credits:integer

2. Author

   - name

   rails g resource Author name

3. Book

- author_id
- title
- page_count
- average_rating
- language
- preview_link
- info_link
- snippet

rails g resource Book author:belongs_to title page_count:integer average_rating:integer language preview_link info_link snippet

4. imageLinks

   - book_id
   - small_thumb
   - thumb
   - misc

   rails g resource ImageLink book:belongs_to small_thumb thumb misc

5) Genre

   - name

   rails g resource Genre name

6) IdTag

   - book_id
   - isbn_type
   - isbn_no

   rails g resource IdTag book:belongs_to isbn_type isbn_no

7) Address

   - user_id
   - street_address
   - city
   - state
   - zip_code
   - phone_number
   - country

   rails g resource Address user:belongs_to street_address city state zip_code phone_number country

8. BookAuthor

   - author_id
   - book_id

   rails g resource BookAuthor author:belongs_to book:belongs_to

9. BookGenre

   - book_id
   - genre_id

   rails g resource BookGenre genre:belongs_to book:belongs_to

10. Donation

    - user_id
    - book_id
    - credits_received

    rails g resource Donation user:belongs_to book:belongs_to credits_received:integer

11. Purchase

    - user_id
    - book_id
    - credits_used

    rails g resource Purchase user:belongs_to book:belongs_to used:integer

## Terminal Commands

rails g resource User username full_name email password_digest credits:integer

rails g resource Author name

rails g resource Book title page_count:integer average_rating:integer language preview_link info_link snippet

rails g resource ImageLink book:belongs_to small_thumb thumb misc

rails g resource Genre name

rails g resource IdTag book:belongs_to isbn_type isbn_no

rails g resource Address user:belongs_to street_address city state zip_code phone_number country

rails g resource BookAuthor author:belongs_to book:belongs_to

rails g resource BookGenre genre:belongs_to book:belongs_to

rails g resource Donation user:belongs_to book:belongs_to credits_received:integer

rails g resource Purchase user:belongs_to book:belongs_to used:integer
