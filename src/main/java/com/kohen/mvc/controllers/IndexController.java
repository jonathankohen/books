package com.kohen.mvc.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kohen.mvc.models.Book;
import com.kohen.mvc.models.Publisher;
import com.kohen.mvc.services.BookServ;
import com.kohen.mvc.services.PubServ;

@Controller
public class IndexController {
	private static BookServ bookServ;
	private static PubServ pubServ;

	public IndexController(BookServ bookServ, PubServ pubServ) {
		IndexController.bookServ = bookServ;
		IndexController.pubServ = pubServ;
	}

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("books", bookServ.getAll());
		model.addAttribute("newBook", new Book());
		return "index";
	}

	@PostMapping("/books")
	public String create(@Valid @ModelAttribute("newBook") Book book, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("books", bookServ.getAll());
			return "index";
		} else {
			bookServ.createBook(book);
			return "redirect:/";
		}
	}

	@GetMapping("books/{id}")
	public String showBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleBook", bookServ.getBook(id));
		return "book";
	}

	@GetMapping("books/{id}/edit")
	public String bookDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleBook", bookServ.getBook(id));
		return "edit";
	}

	@PostMapping("/books/{id}/update")
	public String updateBook(@PathVariable("id") Long id, @Valid @ModelAttribute("singleBook") Book singleBook,
			BindingResult result) {
		if (result.hasErrors()) {
			return "book";
		} else {
			bookServ.update(singleBook, id);
			return "redirect:/";
		}
	}

	@PostMapping("/books/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/";
	}

	@GetMapping("/pubs/new")
	public String newPubs(Model model) {
		model.addAttribute("allBooks", bookServ.getAll());
		model.addAttribute("newPub", new Publisher());
		return "newPub";
	}

	@PostMapping("/pubs")
	public String addPubs(@Valid @ModelAttribute("newPub") Publisher newPub, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("allBooks", bookServ.getAll());
			return "newPub";
		}
		pubServ.create(newPub);
		return "redirect:/";
	}

	@PostMapping("/addpub")
	public String addPubAgain(@RequestParam("name") String name, @RequestParam("book") Long book_id,
			RedirectAttributes flash) {
		Publisher addpubagain = new Publisher(name);
		if (name.length() == 0) {
			flash.addFlashAttribute("nameError", "Publisher name is required.");
			return "redirect:/books/" + book_id;
		}
		addpubagain.setBook(bookServ.getBook(book_id));
		pubServ.create(addpubagain);
		return "redirect:/books/" + book_id;
	}
}
