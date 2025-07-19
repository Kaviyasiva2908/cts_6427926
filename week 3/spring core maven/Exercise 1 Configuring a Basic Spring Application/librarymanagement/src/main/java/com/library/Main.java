package com.library;

import com.library.model.Book;
import com.library.service.BookService;
import com.library.repository.BookRepository;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        BookRepository bookRepository = new BookRepository();
        BookService bookService = new BookService(bookRepository);

        List<Book> books = bookService.getAllBooks();
        for (Book book : books) {
            System.out.println(book);
        }
    }
}
