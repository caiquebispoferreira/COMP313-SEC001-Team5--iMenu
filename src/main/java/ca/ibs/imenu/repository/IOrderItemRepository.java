package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * IOrderItemRepository - repository used to persist, merge, delete, and search order item
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Repository
public interface IOrderItemRepository
        extends JpaRepository<OrderItem, Long>, PagingAndSortingRepository<OrderItem, Long>, JpaSpecificationExecutor<IOrderItemRepository> {
}
