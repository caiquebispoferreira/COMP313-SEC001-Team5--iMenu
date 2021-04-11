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

/**
 * IProductRepository - repository used to persist, merge, delete, and search product
 * Date 2021-04-05
 *
 * @author Caique
 * @version 0.0.1
 */
@Repository
public interface IProductRepository
        extends JpaRepository<Product, Long>, PagingAndSortingRepository<Product, Long>, JpaSpecificationExecutor<IProductRepository> {
 
	/**
	 * findByCategory - find products by category
	 * Date 2021-04-05
	 *
	 * @return list of products 
	 */
	List<Product> findByCategory(Category category);
    	
	/**
	 * findTopSoldProducts - find top 5 products that were sold the most
	 * Date 2021-04-05
	 *
	 * @return list of objects 
	 */
	@Query( nativeQuery = true,  value =  "select TOP 5 name,total "
    		+ "from ( SELECT P.NAME, Sum(isnull(QUANTITY,0)) AS total "
    		+ "FROM   orderitems O "
    		+ "right JOIN products P ON O.PRODUCT_ID = P.ID GROUP  BY P.NAME ) as temp "
    		+ "order by total desc" )
    List<Object[]> findTopSoldProducts();
    
    /**
	 * findLessSoldProducts - find top 5 products that were sold the least
	 * Date 2021-04-05
	 *
	 * @return list of objects 
	 */  
    @Query(nativeQuery = true, value = "SELECT TOP 5 P.NAME, Sum(ISNULL(QUANTITY,0)) AS total "
    		+ "FROM products P "
    		+ "LEFT JOIN orderitems O "
    		+ "ON O.PRODUCT_ID = P.ID "
    		+ "GROUP  BY P.NAME ORDER BY 2"   		)
    List<Object[]> findLessSoldProducts();    
}
