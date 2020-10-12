package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    public User save(User user){
        return userService.save(user);
    }
    public void delete(User user){
        userService.delete(user);
    }
    public List<User> findAll(){
        return userService.findAll();
    }
}
