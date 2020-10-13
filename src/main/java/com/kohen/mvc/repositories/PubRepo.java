package com.kohen.mvc.repositories;

import org.springframework.data.repository.CrudRepository;

import com.kohen.mvc.models.Publisher;

public interface PubRepo extends CrudRepository<Publisher, Long> {
}