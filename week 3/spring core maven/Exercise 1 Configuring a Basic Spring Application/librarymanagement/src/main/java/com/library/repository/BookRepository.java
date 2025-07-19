package com.library.repository;

import com.library.model.Book;
import java.util.Arrays;
import java.util.List;

public class BookRepository {
    public List<Book> findAllBooks() {
        return Arrays.asList(
            new Book("The Hobbit", "J.R.R. Tolkien", 1937),
            new Book("Macbeth", "Shakespeare", 3400),
            new Book("Harry Potter", "JK Rowling", 5600)
        );
    }
}
