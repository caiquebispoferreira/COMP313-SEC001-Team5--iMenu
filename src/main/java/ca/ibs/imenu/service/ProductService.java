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

@Service
public class ProductService {
    @Autowired
    private IProductRepository repository;

    public Product save(Product product){
            return repository.save(product);
        }

        public void delete(Product product){
            repository.delete(product);
        }

        public Product findById(Long id) {
            Optional<Product> item = repository.findById(id);
            return item.isPresent()?item.get():null;
        }

        public List<Product> findAll(){
            return repository.findAll();
    }

    public List<Product> findByCategory(Category category){
        return repository.findByCategory(category);
    }
    
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
