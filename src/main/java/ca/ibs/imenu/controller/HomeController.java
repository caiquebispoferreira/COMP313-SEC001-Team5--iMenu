package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("userForm") User userForm, Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        return "login";
    }

    @RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
    public String welcome(Model model, Authentication authentication) {
        org.springframework.security.core.userdetails.User p = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        User user = userService.findByUsername(p.getUsername());

        return user.getRole().equals(Role.Administrator)?"redirect:adminPanel":"redirect:staffPanel";
    }

    @RequestMapping(value = "/adminPanel", method = RequestMethod.GET)
    public String adminPanel(Model model) {
        model.addAttribute("body","adminPanel.jsp");
        model.addAttribute("title", "Panel of Administrator");
        return "adminTemplate";
    }

    @RequestMapping(value = "/staffPanel", method = RequestMethod.GET)
    public String staffPanel(Model model) {
        model.addAttribute("body","staffPanel.jsp");
        model.addAttribute("title", "Panel of Staff");
        return "adminTemplate";
    }

}
