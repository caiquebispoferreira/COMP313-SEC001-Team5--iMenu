package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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



    @RequestMapping(value = "/listProducts", method = RequestMethod.GET)
    public String listProducts(Model model) {
        model.addAttribute("body","products.jsp");
        return "template";
    }

}
