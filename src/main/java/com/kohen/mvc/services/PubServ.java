package com.kohen.mvc.services;

import org.springframework.stereotype.Service;

import com.kohen.mvc.models.Publisher;
import com.kohen.mvc.repositories.PubRepo;

@Service
public class PubServ {
	private static PubRepo pubRepo;

	public PubServ(PubRepo pubRepo) {
		PubServ.pubRepo = pubRepo;
	}

	public Publisher create(Publisher newPub) {
		return pubRepo.save(newPub);
	}
}
