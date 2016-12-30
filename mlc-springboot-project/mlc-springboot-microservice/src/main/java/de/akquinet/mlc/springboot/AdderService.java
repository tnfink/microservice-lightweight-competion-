package de.akquinet.mlc.springboot;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class AdderService {
    @RequestMapping("/adder")
    public float add(@RequestParam(name = "summand1") float summand1, @RequestParam(name = "summand2") float summand2) {
        return summand1 + summand2;
    }
}
