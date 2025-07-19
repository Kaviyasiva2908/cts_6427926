package com.cognizant.orm_learn.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;

import com.cognizant.orm_learn.model.Country;
import com.cognizant.orm_learn.service.CountryService;

import java.util.List;

@RestController
@RequestMapping("/countries")
public class CountryController {

    @Autowired
    private CountryService countryService;

    @RequestMapping("")
    public List<Country> getAllCountries() {
        return countryService.getAllCountries();
    }
}
