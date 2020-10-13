package com.kohen.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kohen.mvc.models.Book;
import com.kohen.mvc.repositories.BookRepo;

@Service
public class BookServ {
	private static BookRepo bookRepo;

	public BookServ(BookRepo bookRepo) {
		BookServ.bookRepo = bookRepo;
	}

	// returns all books
	public List<Book> getAll() {
		return (List<Book>) bookRepo.findAll();
	}

	// creates a book
	public Book createBook(Book b) {
		return bookRepo.save(b);
	}

	// retrieves a book
	public Book getBook(Long id) {
		Optional<Book> book = bookRepo.findById(id);
		return book.isPresent() ? book.get() : null;
	}

	public Book update(Book toUpdate, Long id) {
		return bookRepo.save(toUpdate);
	}

	public void delete(Long id) {
		bookRepo.deleteById(id);
	}
}
