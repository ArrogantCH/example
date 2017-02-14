package com.boom.springboot2.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boom.springboot2.entity.Animal;
import com.boom.springboot2.service.AnimalService;

@Controller
@RequestMapping("/animal")
public class AnimalController {

	@Autowired
	private AnimalService animalService;
	
	@RequestMapping("/save")
	@ResponseBody
	public String save(String name){
		Animal animal = new Animal();
		animal.setName(name);
		int id = animalService.save(animal);
		return String.valueOf(id);
	}
}
