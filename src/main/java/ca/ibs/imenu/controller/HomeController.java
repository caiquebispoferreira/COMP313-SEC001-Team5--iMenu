package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;

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

    @RequestMapping(value = "/viewLogin", method = RequestMethod.GET)
    public String viewLogin() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model model, String username, String password) {
        User user = userService.findByUsername(username);
        if (user!=null && user.getPassword().equals(password)){

            model.addAttribute("body",(user.getRole().equals(Role.Administrator)?"adminPanel":"staffPanel")+".jsp");
            model.addAttribute("object",user);
            model.addAttribute("title", "Panel of "+(user.getRole().equals(Role.Administrator)?"Administrator":"Staff"));

            return "adminTemplate";
        } else {
            model.addAttribute("msgErro","Username/Password is invalid");
        }
        return "login";
    }

    @RequestMapping(value = "/adminPanel", method = RequestMethod.GET)
    public String adminPanel(Model model) {
        model.addAttribute("body","adminPanel.jsp");
        model.addAttribute("title", "Panel of Administrator");
        return "adminTemplate";
    }



}
