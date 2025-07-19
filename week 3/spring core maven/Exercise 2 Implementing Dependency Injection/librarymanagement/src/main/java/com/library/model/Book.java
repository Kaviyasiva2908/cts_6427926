package com.library.model;
import com.library.service.BookService;

public class Book {
    private String title;
    private String author;
    private double price;

    // Constructor
    public Book(String title, String author, double price) {
        this.title = title;
        this.author = author;
        this.price = price;
    }

    // Getters
    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public double getPrice() {
        return price;
    }

    // toString for pretty printing
    @Override
    public String toString() {
        return title + " by " + author + " - Rs." + price;
    }
}
