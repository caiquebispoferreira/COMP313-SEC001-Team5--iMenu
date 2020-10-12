package ca.ibs.imenu.service;

import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.repository.IProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
