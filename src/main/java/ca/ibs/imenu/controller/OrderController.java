package ca.ibs.imenu.controller;

import ca.ibs.imenu.dto.OrderDTO;
import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.entity.Status;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/commitSaveOrder", method = RequestMethod.POST)
    public String commitSaveOrder(Model model, Order order) {
        orderService.save(order);
        return "redirect:listOrder";
    }

    @RequestMapping(value = "/commitDeleteOrder", method = RequestMethod.POST)
    public String commitDeleteOrder(Model model, Order order) {
        orderService.delete(orderService.findById(order.getId()));
        return "redirect:listOrder";
    }

    @RequestMapping(value = "/listOrder", method = RequestMethod.GET)
    public String listOrder(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","orders.jsp");
        model.addAttribute("object",orderService.convertOrdersToDTO(orderService.findAll()));
        model.addAttribute("title", "List of Orders");
        return "adminTemplate";
    }

    @RequestMapping(value = "/listOrderByTable", method = RequestMethod.GET)
    public String listOrderByTable(Model model, int tableNumber, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","order.jsp");
        model.addAttribute("object",new OrderDTO(orderService.findByTableNumber(tableNumber)));
        model.addAttribute("title", "List Order by Table");
        return "adminTemplate";
    }

    @RequestMapping("/changeTableNumber")
    public String changeTableNumber(Authentication authentication, Model model) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","changeTableNumber.jsp");
        model.addAttribute("title", "Change table number");
        return "adminTemplate";
    }

    @RequestMapping(value = "/changeTableNumber", method = RequestMethod.POST)
    public String changeTableNumber(Model model, int newTableNumber, Order order, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","order.jsp");
        model.addAttribute("object",new OrderDTO(orderService.changeTableNumber(order,newTableNumber)));
        model.addAttribute("title", "Change table number");
        return "adminTemplate";
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public String addOrder(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","order.jsp");
        model.addAttribute("object",new Order());
        model.addAttribute("action","/commitSaveOrder");
        model.addAttribute("title", "Add Order");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/editOrder", method = RequestMethod.GET)
    public String editOrder(Model model, @RequestParam(name = "id") Long id,Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","order.jsp");
        model.addAttribute("object",new OrderDTO(orderService.findById(id)));
        model.addAttribute("action","/commitSaveOrder");
        model.addAttribute("title", "Edit Order");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
    public String deleteOrder(Model model, @RequestParam(name = "id") Long id, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","order.jsp");
        model.addAttribute("object",new OrderDTO(orderService.findById(id)));
        model.addAttribute("action","/commitDeleteOrder");
        model.addAttribute("title", "Delete Order");
        model.addAttribute("readonly", true);
        return "adminTemplate";
    }

    @RequestMapping(value = "/myOrder", method = RequestMethod.GET)
    public String myOrder(Model model, int tableNumber){
        Order order = orderService.findByStatusAndTableNumber(tableNumber);
        model.addAttribute("body","myOrder.jsp");
        if (order!=null)
            model.addAttribute("object",new OrderDTO(order));
        else
            model.addAttribute("object",new OrderDTO());
        model.addAttribute("title", "My Order - Table Number " +String.valueOf(tableNumber));
        model.addAttribute("readonly", true);
        return "customerTemplate";
    }

    @RequestMapping(value= "/addItemToMyOrder", method = RequestMethod.GET)
    public String addItemToMyOrder(Long productId, int quantity, int tableNumber){
        OrderItem orderItem = new OrderItem();
        orderItem.setProduct(productService.findById(productId));
        orderItem.setQuantity(quantity);
        orderItem.setUnitPrice(orderItem.getProduct().getUnitPrice());
        orderItem.setTotalPrice(orderItem.getUnitPrice().multiply(new BigDecimal(orderItem.getQuantity())));

        Order order = orderService.findByStatusAndTableNumber(tableNumber);
        if (order==null) {
            order = new Order();
            order.setDate(LocalDate.now());
            order.setTableNumber(tableNumber);
            order.setNote("");
            order.setStatus(Status.OPEN);
        }
        order.addItem(orderItem);
        orderService.save(order);
        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }
}
