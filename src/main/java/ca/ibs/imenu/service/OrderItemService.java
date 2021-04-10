package ca.ibs.imenu.service;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.repository.IOrderItemRepository;
import ca.ibs.imenu.repository.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * OrderItemService - this service class handles requests to save/delete/find an item of the order
 * 
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class OrderItemService {
    @Autowired
    private IOrderItemRepository repository;
 
	/**
	 * save - save item in an order
	 * Date 2020-12-04
	 *
	 * @param orderItem - represents the item that is being saved in the order
	 */
    public OrderItem save(OrderItem orderItem){
        return repository.save(orderItem);
    }

	/**
	 * delete - delete item from an order
	 * Date 2020-12-04
	 *
	 * @param orderItem - represents the item that is being deleted from the order
	 */
    public void delete(OrderItem orderItem){
        repository.delete(orderItem);
    }

	/**
	 * findById - find item by id from order
	 * Date 2020-12-04
	 *
	 * @param id - represents the id of the order's item to find 
	 * @return item
	 */
    public OrderItem findById(Long id) {
        Optional<OrderItem> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }
}
