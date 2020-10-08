package com.kohen.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kohen.mvc.models.Book;
import com.kohen.mvc.repositories.BookRepository;

@Service
public class BookService {
	private static BookRepository bookRepository;
	
	public BookService(BookRepository bookRepository) {
		BookService.bookRepository = bookRepository;
	}
	
	// returns all books
	public List<Book> getAll() {
        return (List<Book>) bookRepository.findAll();
    }
	
    // creates a book
    public Book createBook(Book b) {
        return bookRepository.save(b);
    }
    
    // retrieves a book
    public Book getBook(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.isPresent() ? book.get() : null;
    }
    
    public Book update(Book toUpdate, Long id) {
    	return bookRepository.save(toUpdate);
    }
    
    public void delete(Long id) {
    	bookRepository.deleteById(id);
    }
}
