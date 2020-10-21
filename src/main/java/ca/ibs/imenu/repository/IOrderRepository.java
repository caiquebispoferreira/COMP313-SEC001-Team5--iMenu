package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IOrderRepository
        extends JpaRepository<Order, Long>, PagingAndSortingRepository<Order, Long>, JpaSpecificationExecutor<IOrderRepository> {

    @Query(value = "Select o " +
            "FROM Order o " +
            "WHERE o.status <> :status" +
            "   AND o.tableNumber = :tableNumber  ")
    Order findByStatusAndTableNumber(Status status, int tableNumber);
}
