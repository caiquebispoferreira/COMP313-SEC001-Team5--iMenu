package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IProductRepository
        extends JpaRepository<Product, Long>, PagingAndSortingRepository<Product, Long>, JpaSpecificationExecutor<IProductRepository> {
}
