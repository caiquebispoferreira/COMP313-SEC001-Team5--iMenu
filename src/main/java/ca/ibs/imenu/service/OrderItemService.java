package ca.ibs.imenu.service;


import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.repository.IOrderItemRepository;
import ca.ibs.imenu.repository.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderItemService {
    @Autowired
    private IOrderItemRepository repository;

    public OrderItem save(OrderItem orderItem){
        return repository.save(orderItem);
    }

    public void delete(OrderItem orderItem){
        repository.delete(orderItem);
    }

    public OrderItem findById(Long id) {
        Optional<OrderItem> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }
}
