package com.kohen.mvc.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kohen.mvc.models.Book;

@Repository
public interface BookRepo extends CrudRepository<Book, Long> {}
