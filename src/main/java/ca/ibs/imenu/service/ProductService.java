package ca.ibs.imenu.service;

import ca.ibs.imenu.dto.SoldProduct;
import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.repository.IProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * ProductService - this service class handles requests to save/delete/find product
 * 
 * Date 2021-04-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class ProductService {
    @Autowired
    private IProductRepository repository;

    /**
  	 * save - save product
  	 * Date 2020-12-04
  	 *
  	 * @param product - product to be saved
  	 * @return product that is saved in the repository
  	 */
    public Product save(Product product){
            return repository.save(product);
        }
 
    /**
  	 * delete - delete product
  	 * Date 2020-12-04
  	 *
  	 * @param product - product to be deleted
  	 */
    public void delete(Product product){
        repository.delete(product);
    }

    /**
   	 * findById - find product by id
   	 * Date 2020-12-04
   	 *
   	 * @param id - id of the product to be found
   	 * @return product found in the repository (if found)
   	 */
    public Product findById(Long id) {
        Optional<Product> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }

    /**
   	 * findAll - find products of repository
   	 * Date 2020-12-04
   	 *
   	 * @return list of products returned from repository 
   	 */
    public List<Product> findAll(){
        return repository.findAll();
    }

    /**
   	 * findByCategory - find product by category
   	 * Date 2020-12-04
   	 *
   	 * @param category - category of the product
   	 * @return list of products being in the given category
   	 */
    public List<Product> findByCategory(Category category){
        return repository.findByCategory(category);
    }
    
    /**
   	 * findLessSoldProducts - find the bottom 5 sold products
   	 * Date 2021-04-04
   	 *
   	 * @return list of bottom 5 sold products
   	 */
    public List<SoldProduct> findLessSoldProducts() {
    	List<Object[]> list = repository.findLessSoldProducts();
    	List<SoldProduct> sold = new ArrayList();
    	for (int i = 0;i <list.size() ;i++) {
    		Object[] prod = list.get(i);
    		String name= (String) prod[0];
    		int quant= (int) prod[1];
    		sold.add(new SoldProduct(name,quant));
    	}
		return sold;
	}
    
    /**
   	 * findTopSoldProducts - find the top 5 sold products
   	 * Date 2021-04-04
   	 *
   	 * @return list of top 5 sold products
   	 */
    public List<SoldProduct> findTopSoldProducts() {
  		
  		List<Object[]> list = repository.findTopSoldProducts();
    	List<SoldProduct> sold = new ArrayList();
    	for (int i = 0;i <list.size() ;i++) {
    		Object[] prod = list.get(i);
    		String name= (String) prod[0];
    		int quant= (int) prod[1];
    		sold.add(new SoldProduct(name,quant));
    	}
    	return sold;
  	}   
}
