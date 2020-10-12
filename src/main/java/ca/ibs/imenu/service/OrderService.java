package ca.ibs.imenu.service;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.repository.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    private IOrderRepository repository;

    public Order save(Order order){
        return repository.save(order);
    }

    public void delete(Order order){
        repository.delete(order);
    }

    public Order findById(Long id) {
        Optional<Order> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }

    public List<Order> findAll(){
        return repository.findAll();
    }
}
