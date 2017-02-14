package com.boom.springboot2.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.springboot2.entity.Animal;
import com.boom.springboot2.mapper.AnimalMapper;

@Repository
public class AnimalRepository {

	private AnimalMapper animalMapper;

	public int save(Animal animal){
		animalMapper.save(animal);
		return animal.getId();
	}
}
