package com.library.service;

import com.library.model.Book;
import com.library.repository.BookRepository;

import java.util.List;

public class BookService {

    private BookRepository bookRepository;

    // Constructor to inject BookRepository
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getAllBooks() {
        return bookRepository.findAllBooks();  // Make sure this method exists in BookRepository
    }
}

