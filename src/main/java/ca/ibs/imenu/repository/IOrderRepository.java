package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IOrderRepository
        extends JpaRepository<Order, Long>, PagingAndSortingRepository<Order, Long>, JpaSpecificationExecutor<IOrderRepository> {
}
