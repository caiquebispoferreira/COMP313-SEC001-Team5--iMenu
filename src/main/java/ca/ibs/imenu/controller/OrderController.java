package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/commitSaveOrder", method = RequestMethod.POST)
    public String commitSaveOrder(Model model, Order order){
        orderService.save(order);
        return "redirect:index";

    }

    @RequestMapping(value = "/commitDeleteOrder", method = RequestMethod.POST)
    public String commitDeleteOrder(Model model, Order order){
        orderService.delete(orderService.findById(order.getId()));
        return "redirect:listAllOrders";
    }

    @RequestMapping(value = "/listOrder", method = RequestMethod.GET)
    public String listOrder(Model model){
        model.addAttribute("body","orders.jsp");
        model.addAttribute("object",orderService.findAll());
        return "orders";
    }

    @RequestMapping(value = "/myOrder", method = RequestMethod.GET)
    public String myOrder(Model model, int tableNumber){
        model.addAttribute("object",orderService.findByStatusAndTableNumber(tableNumber));
        return "myOrder";
    }

    @RequestMapping(value= "/addItemToOrder", method = RequestMethod.GET)
    public String addItemToOrder(Long productId, int quantity, int tableNumber){
        OrderItem orderItem = new OrderItem();
        orderItem.setProduct(productService.findById(productId));
        orderItem.setQuantity(quantity);
        orderItem.setUnitPrice(orderItem.getProduct().getUnitPrice());
        orderItem.setTotalPrice(orderItem.getUnitPrice().multiply(new BigDecimal(orderItem.getQuantity())));

        Order order = orderService.findByStatusAndTableNumber(tableNumber);
        if (order==null) {
            order = new Order();
            order.setDate(new Date());
            order.setTableNumber(tableNumber);
            order.setNote("");

        }
        order.addItem(orderItem);
        orderService.save(order);
        return "redirect:ListCart?tableNumber=1";
    }
}
