package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    public Order save(Order order){
        return orderService.save(order);
    }
    public void delete(Order order){
        orderService.delete(order);
    }
    public List<Order> findAll(){
        return orderService.findAll();
    }
}
