package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    // Setter for Dependency Injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Example method to demonstrate usage
    public void displayBooks() {
        bookRepository.getAllBooks().forEach(System.out::println);
    }
}

