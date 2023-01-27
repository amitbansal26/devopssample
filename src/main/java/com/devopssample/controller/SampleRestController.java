package com.devopssample.controller;

import com.devopssample.records.Person;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleRestController {

    @GetMapping("/name")
    public Person getPersonDetails(){
     return new Person("Amit", "Lucknow", "Professional");
    }
}
