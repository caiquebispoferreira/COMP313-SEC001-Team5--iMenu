package ca.ibs.imenu.controller;

import ca.ibs.imenu.dto.OrderDTO;
import ca.ibs.imenu.dto.OrderItemDTO;
import ca.ibs.imenu.entity.*;
import ca.ibs.imenu.service.OrderItemService;
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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/commitSaveOrder", method = RequestMethod.POST)
    public String commitSaveOrder(Model model, Order order) {
        Order orderDb = orderService.findById(order.getId());
        orderDb.setStatus(order.getStatus());
        orderDb.setNote(order.getNote());
        orderDb.calcTotal();
        orderService.save(orderDb);
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

    @RequestMapping(value = "/listOrderByTableNumber", method = RequestMethod.GET)
    public String listOrderByTableNumber(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        List<Order> orders = orderService.findAll();
        List<OrderDTO> dtos = new ArrayList<>();
        for (Order o : orders){
            List<OrderItemDTO> items = new ArrayList<>();
            for (OrderItem item: o.getItems() ){
                if (!item.isDelivered())
                    items.add(new OrderItemDTO(item));
            }
            if (items.size()>0){
                OrderDTO dto = new OrderDTO(o);
                dto.setItems(items);
                dtos.add(dto);
            }
        }

        model.addAttribute("body","orders.jsp");
        model.addAttribute("object",dtos);
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
        order.calcTotal();
        orderService.save(order);
        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }

    @RequestMapping(value= "/deleteItemFromMyOrder", method = RequestMethod.GET)
    public String deleteItemFromMyOrder(int tableNumber,Long orderId, Long itemId){
        Order order = orderService.findById(orderId);
        List<OrderItem> items = new ArrayList<>();
        for (OrderItem o : order.getItems()){
            if (o.getId().compareTo(itemId)!=0){
                items.add(o);
            } else {
                o.setOrder(null);
            }
        }
        order.setItems(items);
        order.calcTotal();
        orderService.save(order);
        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }


    @RequestMapping(value = "/reviewProductByOrderItem", method = RequestMethod.GET)
    public String reviewProductByOrderItem(Model model, int tableNumber, Long orderItemId){
        OrderItem orderItem = orderItemService.findById(orderItemId);
        model.addAttribute("body","reviewProduct.jsp");
        model.addAttribute("object",new OrderItemDTO(orderItem));
        model.addAttribute("tableNumber",tableNumber);
        model.addAttribute("title", "Review Product - " +orderItem.getProduct().getName());

        return "customerTemplate";
    }


    @RequestMapping(value= "/reviewProduct", method = RequestMethod.GET)
    public String reviewProduct(Long orderItemId,int tableNumber, int rating, String username, String notes){
        OrderItem orderItem = orderItemService.findById(orderItemId);

        if (orderItem !=null){
            if ( !orderItem.isReviewed()){
                ProductReview review = new ProductReview();
                review.setRating(rating);
                review.setNotes(notes);
                review.setUserName(username);

                orderItem.getProduct()
                        .addReview(review);

                orderItem.setProduct(productService.save(orderItem.getProduct()));

                orderItem.setReviewed(true);

                orderItem = orderItemService.save(orderItem);
            }
        }

        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }


    @RequestMapping(value= "/updateNoteFromMyOrder", method = RequestMethod.GET)
    public String updateNoteFromMyOrder(Long orderId,int tableNumber, String note){
        Order order = orderService.findById(orderId);
        order.setNote(note);
        order.calcTotal();
        orderService.save(order);
        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }

    @RequestMapping(value= "/changeItemToDelivered", method = RequestMethod.GET)
    public String changeItemToDelivered(Long orderId, Long itemId){
        Order order = orderService.findById(orderId);
        for (OrderItem o : order.getItems()){
            if (o.getId().compareTo(itemId)==0) {
                o.setDelivered(true);
                break;
            }
        }
        orderService.save(order);
        return "redirect:listOrderByTableNumber";
    }


    @RequestMapping(value= "/changeStatusToConfirmed", method = RequestMethod.GET)
    public String changeStatusToConfirmed(Long orderId,int tableNumber){
        Order order = orderService.findById(orderId);
        order.setStatus(Status.CONFIRMED);
        order.calcTotal();
        orderService.save(order);
        return "redirect:myOrder?tableNumber="+String.valueOf(tableNumber);
    }


}
