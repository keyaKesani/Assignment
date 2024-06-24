-- create the tables

CREATE TABLE books (
  book_id INT PRIMARY KEY IDENTITY(1, 1),
  book_title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE authors (
  author_id INT PRIMARY KEY IDENTITY(100, 1),
  author_name VARCHAR(255) NOT NULL,
  author_country VARCHAR(50)
);

CREATE TABLE borrowers (
  borrower_id INT PRIMARY KEY IDENTITY(1000, 1),
  book_id INT NOT NULL,
  borrower_name VARCHAR(255) NOT NULL,
  borrow_date DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- populate the tables

INSERT INTO authors (author_name, author_country)
VALUES
    ('George Orwell', 'United Kingdom'),
    ('Harper Lee', 'United States'),
    ('J.K. Rowling', 'United Kingdom'),
    ('J.R.R. Tolkien', 'United Kingdom'),
    ('Mark Twain', 'United States');

INSERT INTO books (book_title, author_id, publication_date)
VALUES
    ('1984', 100, '1949-06-08'),
    ('Animal Farm', 100, '1945-08-17'),
    ('To Kill a Mockingbird', 101, '1960-07-11'),
    ('Harry Potter and the Sorcerer''s Stone', 102, '1997-06-26'),
    ('Harry Potter and the Chamber of Secrets', 102, '1998-07-02'),
    ('The Hobbit', 103, '1937-09-21'),
    ('The Adventures of Tom Sawyer', 104, '1876-04-30'),
    ('The Adventures of Huckleberry Finn', 104, '1884-12-10');

INSERT INTO borrowers (book_id, borrower_name, borrow_date, return_date)
VALUES
    (1, 'Alice Johnson', '2024-06-01', '2024-06-15'),
    (3, 'Bob Smith', '2024-06-05', '2024-06-20'),
    (4, 'Charlie Brown', '2024-06-10', '2024-06-24'),
    (2, 'David White', '2024-06-12', NULL), 
    (5, 'Emma Green', '2024-06-15', '2024-06-30'),
    (6, 'Fiona Black', '2024-06-17', NULL), 
    (7, 'George Harris', '2024-06-18', '2024-07-02'),
    (8, 'Hannah King', '2024-06-20', NULL);  

-- solution Query

SELECT b.book_title, a.author_name, bo.borrower_name, bo.borrow_date, bo.return_date
FROM books b
INNER JOIN authors a ON a.author_id = b.author_id
LEFT JOIN borrowers bo ON bo.book_id = b.book_id