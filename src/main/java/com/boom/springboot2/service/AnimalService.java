package com.boom.springboot2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.springboot2.entity.Animal;
import com.boom.springboot2.repository.AnimalRepository;

@Service
public class AnimalService {

	@Autowired
	private AnimalRepository animalRepository;
	
	public int save(Animal animal){
		return animalRepository.save(animal);
	}
}
