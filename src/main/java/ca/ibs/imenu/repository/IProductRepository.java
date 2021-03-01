package ca.ibs.imenu.repository;

import ca.ibs.imenu.dto.SoldProduct;
import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductRepository
        extends JpaRepository<Product, Long>, PagingAndSortingRepository<Product, Long>, JpaSpecificationExecutor<IProductRepository> {

    List<Product> findByCategory(Category category);
    @Query( nativeQuery = true,  value = "SELECT TOP 5 P.NAME, "
    		+ "Sum(QUANTITY) AS total "
    		+ "FROM   orderitems O "
    		+ "INNER JOIN products P "
    		+ "ON O.PRODUCT_ID = P.ID GROUP  BY P.NAME")
    List<Object[]> findTopSoldProducts();
    
    @Query(nativeQuery = true, value = "select TOP 5 name,total "
    		+ "from ( SELECT P.NAME, Sum(QUANTITY) AS total "
    		+ "FROM   orderitems O "
    		+ "INNER JOIN products P ON O.PRODUCT_ID = P.ID GROUP  BY P.NAME ) as temp "
    		+ "order by total desc"    		)
    List<Object[]> findLessSoldProducts();
    
}
