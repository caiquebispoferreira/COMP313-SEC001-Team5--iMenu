package ca.ibs.imenu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String defaultIndex(Model model) {
        model.addAttribute("name","World");
        return "index";
    }

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("name","Caique");
        return "index";
    }

}
