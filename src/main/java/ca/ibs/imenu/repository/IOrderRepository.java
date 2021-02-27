package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IOrderRepository
        extends JpaRepository<Order, Long>, PagingAndSortingRepository<Order, Long>, JpaSpecificationExecutor<IOrderRepository> {

    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.status <> :status" +
            "   AND o.tableNumber = :tableNumber  ")
    Order findByStatusAndTableNumber(Status status, int tableNumber);

    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.status <> :status")
    List<Order> myFindAll(Status status);

    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.tableNumber = :tableNumber" )
    Order findByTableNumber(int tableNumber);
    
    @Query( nativeQuery = true,value="select day(o.date) as day , sum(total_price) as total "
    		+ "from orders o "
    		+ "where Month(getdate()) = Month(o.date) "
    		+ "group by day(o.date) "
    		+ "order by 1")
    List<Object[]> getMonthProfitByDay(); 
}
