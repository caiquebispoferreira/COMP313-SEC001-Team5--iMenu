package ca.ibs.imenu.service;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.entity.Status;
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

    public Order addItemToOrder(Order order,OrderItem orderItem){
        order.addItem(orderItem);
        return order;
    }


    public Order findByStatusAndTableNumber(int tableNumber){
        return repository.findByStatusAndTableNumber(Status.PAID,tableNumber);
    }

    public Order findByTableNumber(int tableNumber){
        return repository.findByTableNumber(tableNumber);
    }

    public Order changeTableNumber(Order _order, int newTableNumber){
        Order order = findByTableNumber(_order.getTableNumber());
        if(order != null)
        {
            order.setTableNumber(newTableNumber);
            return order;
        }
        return null;
    }

}
