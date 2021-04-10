package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;



/**
 * IOrderRepository - repository used to persist, merge, delete and search orders
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Repository
public interface IOrderRepository
        extends JpaRepository<Order, Long>, PagingAndSortingRepository<Order, Long>, JpaSpecificationExecutor<IOrderRepository> {

	/**
	 * findByStatusAndTableNumber - find order which have the filtered status and table number
	  * Date 2020-12-04
	 *
	 * @param status  - table number which will be considered in the query
	 * @param tableNumber - table number which will be considered in the query
	 * @return Order 
	 */
    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.status <> :#{#status}" +
            "   AND o.tableNumber = :#{#tableNumber}  ")
    Order findByStatusAndTableNumber(@Param("status") Status status,@Param("tableNumber") int tableNumber);

    /**
	 * myFindAll - list of orders which have the filtered status
	 * Date 2020-12-04
	 *
	 * @param status  - table number which will be considered in the query
	 * @return Order 
	 */
    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.status <> :#{#status}")
    List<Order> myFindAll(@Param("status") Status status);

    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.tableNumber = :#{#tableNumber} " )
    Order findByTableNumber(@Param("tableNumber") int tableNumber);
    
    @Query( nativeQuery = true,value="select day(o.date) as day , sum(total_price) as total "
    		+ "from orders o "
    		+ "where Month(getdate()) = Month(o.date) "
    		+ "group by day(o.date) "
    		+ "order by 1")
    List<Object[]> getMonthProfitByDay(); 
}
