package com.project.cm.controller;

import com.project.cm.model.SearchParam;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class PostController {

    @PostMapping(value = "/postMethod")
    public SearchParam postMethod(@RequestBody SearchParam searchParam) {

        return searchParam;
    }

    @PutMapping
    public void put() {

    }
    @PatchMapping("/patchMethod")
    public void patch() {

    }
}
