package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    public Product save(Product product){
        return productService.save(product);
    }
    public void delete(Product product){
        productService.delete(product);
    }
    public List<Product> findAll(){
        return productService.findAll();
    }
}
