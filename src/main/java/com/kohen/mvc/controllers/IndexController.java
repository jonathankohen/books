package com.kohen.mvc.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kohen.mvc.models.Book;
import com.kohen.mvc.services.BookService;

@Controller
public class IndexController {
	private static BookService bookService;
	
	public IndexController(BookService bookService) {
		IndexController.bookService = bookService;
	}
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("books", bookService.getAll());
		model.addAttribute("newBook", new Book());
		return "index";
	}
	
	@PostMapping("/books")
	public String create(@Valid @ModelAttribute("newBook") Book book, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("books", bookService.getAll());
			return "index";
		} else {
			bookService.createBook(book);
			return "redirect:/";			
		}
	}
	
	@GetMapping("books/{id}")
	public String showBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleBook", bookService.getBook(id));
		return "book";
	}
	
	@GetMapping("books/{id}/edit")
	public String bookDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleBook", bookService.getBook(id));
		return "edit";
	}
	
	@PostMapping("/books/{id}/update") 
	public String updateBook(@PathVariable("id") Long id, @Valid @ModelAttribute("singleBook") Book singleBook, BindingResult result) {
		if (result.hasErrors()) {
			return "book";
		} else {
			bookService.update(singleBook, id);
			return "redirect:/";			
		}
	}
	
	@PostMapping("/books/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
        bookService.delete(id);
        return "redirect:/";
    }
}
