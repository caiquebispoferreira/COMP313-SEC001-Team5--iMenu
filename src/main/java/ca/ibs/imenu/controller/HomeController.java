package ca.ibs.imenu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String defaultIndex(Model model) {
        model.addAttribute("name","World");
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model, @RequestParam(name = "name",defaultValue = "Caique") String name) {
        model.addAttribute("name",name);
        return "index";
    }



}
