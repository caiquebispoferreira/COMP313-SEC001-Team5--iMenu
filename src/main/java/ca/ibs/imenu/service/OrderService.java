package ca.ibs.imenu.service;

import ca.ibs.imenu.dto.OrderDTO;
import ca.ibs.imenu.dto.ProfitByDay;
import ca.ibs.imenu.dto.SoldProduct;
import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.entity.Status;
import ca.ibs.imenu.repository.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * OrderService - this service class handles all requests related to order(s) - i.e. add/delete/save/findById/findAll order into/from repository, etc.
 * 
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class OrderService {
    @Autowired
    private IOrderRepository repository;
    
	/**
	 * save - save order in the repository 
	 * Date 2020-12-04
	 *
	 * @param order - represents order being saved 
	 * @return order being saved
	 */
    public Order save(Order order){
        return repository.save(order);
    }

    /**
	 * delete - delete order from the repository 
	 * Date 2020-12-04
	 *
	 * @param order - represents order being deleted 
	 */
    public void delete(Order order){
        repository.delete(order);
    }

    /**
	 * findById - find order by id from the repository 
	 * Date 2020-12-04
	 *
	 * @param id - represents the id of the order that is being searched for 
	 * @return order being found in repository (if it is present)
	 */
    public Order findById(Long id) {
        Optional<Order> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }
    
    /**
	 * findAll - find all orders with status OPEN  
	 * Date 2020-12-04
	 * 
	 * @return list of orders
	 */
    public List<Order> findAll(){
        return repository.myFindAll(Status.OPEN);
    }
  
    /**
 	 * addItemToOrder - add an item to an order 
 	 * Date 2020-12-04
 	 *
 	 * @param order - the order to which the item will be added to
 	 * @param item - the item that will be added to the order 
 	 * 
 	 * @return order to which the item is being added to
 	 */
    public Order addItemToOrder(Order order,OrderItem orderItem){
        order.addItem(orderItem);
        return order;
    }

    /**
 	 * convertOrdersToDTO - converts list of orders into DTO  
 	 * Date 2020-12-04
 	 *
 	 * @param orders - orders that need to be converted
 	 * 
 	 * @return DTO that is being generated
 	 */
    public List<OrderDTO> convertOrdersToDTO(List<Order> orders){
        List<OrderDTO> dTO = new ArrayList<>();
        for (Order order: orders)
            dTO.add(new OrderDTO(order));
        return dTO;
    }

    /**
 	 * findByStatusAndTableNumber - find order by table number and that have PAID status   
 	 * Date 2020-12-04
 	 *
 	 * @param tableNumber - table number of the order
 	 * 
 	 * @return DTO that is being generated
 	 */
    public Order findByStatusAndTableNumber(int tableNumber){
        return repository.findByStatusAndTableNumber(Status.PAID,tableNumber);
    }

    /**
 	 * findByTableNumber - find order by table number  
 	 * Date 2020-12-04
 	 *
 	 * @param tableNumber - table number of the order
 	 * 
 	 * @return retrieved order from the repository
 	 */
    public Order findByTableNumber(int tableNumber){
        return repository.findByTableNumber(tableNumber);
    }

    /**
   	 * changeTableNumber - change table number in order to provide service   
   	 * Date 2020-12-04
   	 *
   	 * @param order - current order
   	 * @param newTableNumber - the table that the current order will be migrated to
   	 * 
   	 * @return order
   	 */
    public Order changeTableNumber(Order _order, int newTableNumber){
        Order order = findByTableNumber(_order.getTableNumber());
        if(order != null)
        {
            order.setTableNumber(newTableNumber);
            return order;
        }
        return null;
    }    

    /**
   	 * getMonthProfitByDay - shows the profit by day for the current month    
   	 * Date 2020-12-04
   	 * 
   	 * @return list of profits by day
   	 */
    public List<ProfitByDay> getMonthProfitByDay() {
  		
  		List<Object[]> list = repository.getMonthProfitByDay();
    	List<ProfitByDay> p = new ArrayList();
    	for (int i = 0;i <list.size() ;i++) {
    		Object[] daily = list.get(i);
    		int day = (int) daily[0];
    		BigDecimal total= (BigDecimal) daily[1];
    		p.add(new ProfitByDay(day,total));
    	}
    	return p;
  	}    
}
