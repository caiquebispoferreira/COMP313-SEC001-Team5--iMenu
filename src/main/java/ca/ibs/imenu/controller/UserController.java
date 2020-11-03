package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/commitSaveUser", method = RequestMethod.POST)
    public String commitSaveUser(Model model, User user) {
        userService.save(user);
        return "redirect:listUser";
    }

    @RequestMapping(value = "/commitDeleteUser", method = RequestMethod.POST)
    public String commitDeleteUser(Model model, User user) {
        userService.delete(userService.findById(user.getId()));
        return "redirect:listUser";
    }

    @RequestMapping(value = "/listUser", method = RequestMethod.GET)
    public String listUser(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","users.jsp");
        model.addAttribute("object",userService.findAll());
        model.addAttribute("title", "List of Users");
        return "adminTemplate";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(Model model,Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","user.jsp");
        model.addAttribute("object",new User());
        model.addAttribute("action","/commitSaveUser");
        model.addAttribute("title", "Add User");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public String editUser(Model model, @RequestParam(name = "id") Long id, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","user.jsp");
        model.addAttribute("object",userService.findById(id));
        model.addAttribute("action","/commitSaveUser");
        model.addAttribute("title", "Edit User");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deleteUser(Model model, @RequestParam(name = "id") Long id, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","user.jsp");
        model.addAttribute("object",userService.findById(id));
        model.addAttribute("action","/commitDeleteUser");
        model.addAttribute("title", "Delete User");
        model.addAttribute("readonly", true);
        return "adminTemplate";
    }

}
