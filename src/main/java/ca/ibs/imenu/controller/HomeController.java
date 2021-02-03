package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.*;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = { "/index", "/"}, method = RequestMethod.GET)
    public String index(Model model, Authentication authentication) {
        boolean result = authentication != null && authentication.isAuthenticated();
        model.addAttribute("body","index.jsp");
        return result?"redirect:welcome":"customerTemplate";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("userForm") User userForm, Model model, String error, String logout) {
        checkUser();
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        return "login";
    }

    @RequestMapping(value = { "/welcome" }, method = RequestMethod.GET)
    public String welcome(Model model, Authentication authentication) {
        org.springframework.security.core.userdetails.User p = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        User user = userService.findByUsername(p.getUsername());

        return user.getRole().equals(Role.ADMINISTRATOR)?"redirect:adminPanel":"redirect:staffPanel";
    }

    @RequestMapping(value = "/adminPanel", method = RequestMethod.GET)
    public String adminPanel(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","adminPanel.jsp");
        model.addAttribute("title", "Panel of Administrator");
        return "adminTemplate";
    }

    @RequestMapping(value = "/staffPanel", method = RequestMethod.GET)
    public String staffPanel(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","staffPanel.jsp");
        model.addAttribute("title", "Panel of Staff");
        return "adminTemplate";
    }

    private void checkUser(){
        User user = userService.findByUsername("admin");
        if (user==null){
            user = new User();
            user.setName("Administrator");
            user.setRole(Role.ADMINISTRATOR);
            user.setPassword("admin");
            user.setUsername("admin");
            userService.save(user);
        }

/*        OrderItem item = new OrderItem();
        item.setTotalPrice(new BigDecimal(1000));
        item.setUnitPrice(new BigDecimal(1000));
        item.setQuantity(1);
        item.setProduct(productService.findAll().get(0));

        OrderItem itema = new OrderItem();
        itema.setTotalPrice(new BigDecimal(1000));
        itema.setUnitPrice(new BigDecimal(1000));
        itema.setQuantity(1);
        itema.setProduct(productService.findAll().get(1));

        Order order = new Order();
        order.setStatus(Status.OPEN);
        order.setTableNumber(1);
        order.setTotalPrice(new BigDecimal(2000));
        order.setNote("Special Notes added");
        order.setDate(LocalDate.now());
        order.addItem(item);
        order.addItem(itema);

        orderService.save(order);
*/
    }

}
