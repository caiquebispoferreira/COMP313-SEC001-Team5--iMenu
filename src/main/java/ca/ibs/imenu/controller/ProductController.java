package ca.ibs.imenu.controller;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.service.ProductService;
import ca.ibs.imenu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.LinkedList;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/commitSaveProduct", method = RequestMethod.POST)
    public String commitSaveProduct(Model model, Product product) {
        productService.save(product);
        return "redirect:listProduct";
    }

    @RequestMapping(value = "/commitDeleteProduct", method = RequestMethod.POST)
    public String commitDeleteProduct(Model model, Product product) {
        productService.delete(productService.findById(product.getId()));
        return "redirect:listProduct";
    }

    @RequestMapping(value = "/listProduct", method = RequestMethod.GET)
    public String listProduct(Model model, Authentication authentication) {

        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","products.jsp");
        model.addAttribute("object",productService.findAll());
        model.addAttribute("title", "List of Products");
        return "adminTemplate";
    }

    @RequestMapping(value = "/listProductByCategory", method = RequestMethod.GET)
    public String listProductByCategory(Model model,@RequestParam(name = "category", defaultValue = "APPETIZER") String category) {
        model.addAttribute("body","productsByCategory.jsp");
        model.addAttribute("object",productService.findByCategory(Category.valueOf(category)));
        model.addAttribute("title", "List of "+category);
        return "customerTemplate";
    }


    @RequestMapping(value = "/listReviewByProduct", method = RequestMethod.GET)
    public String listReviewByProduct(Model model,@RequestParam(name = "id") Long id) {
        model.addAttribute("body","reviewsByProduct.jsp");
        model.addAttribute("object",productService.findById(id));
        model.addAttribute("title", "List of reviews");
        return "customerTemplate";
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","product.jsp");
        model.addAttribute("object",new Product());
        model.addAttribute("action","/commitSaveProduct");
        model.addAttribute("title", "Add Product");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public String editProduct(Model model, @RequestParam(name = "id") Long id, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","product.jsp");
        model.addAttribute("object",productService.findById(id));
        model.addAttribute("action","/commitSaveProduct");
        model.addAttribute("title", "Edit Product");
        model.addAttribute("readonly", false);
        return "adminTemplate";
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
    public String deleteProduct(Model model, @RequestParam(name = "id") Long id,Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        model.addAttribute("body","product.jsp");
        model.addAttribute("object",productService.findById(id));
        model.addAttribute("action","/commitDeleteProduct");
        model.addAttribute("title", "Delete Product");
        model.addAttribute("readonly", true);
        return "adminTemplate";
    }

    @RequestMapping(value = "/uploadImage", method = RequestMethod.GET)
    public String uploadImage(Model model, @RequestParam(name = "id") Long id, Authentication authentication) {
        if (authentication!=null && authentication.isAuthenticated()){
            model.addAttribute("currentUser",userService.findByUsername(((org.springframework.security.core.userdetails.User)
                    authentication.getPrincipal()).getUsername()));
        }
        Product product = productService.findById(id);
        model.addAttribute("body","uploadImage.jsp");
        model.addAttribute("object",product);
        model.addAttribute("action","/uploadImage");
        model.addAttribute("title", "Upload image to "+product.getName());

        return "adminTemplate";
    }

    private final String IMAGE = "Z:\\Google Drive\\Engenheira\\Centennial\\Semester 5\\Workspace\\iMenuBackend" +
            "\\src\\main\\webapp\\resources\\img";


    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/uploadImage",method = RequestMethod.POST)
    public String uploadImage(@RequestParam("image") MultipartFile image,@RequestParam("productId") Long productId ) {
        //File file = new File(IMAGE);
        //image.transferTo(file);
        Product p = productService.findById(productId);
        p.setHasImage(true);
        productService.save(p);
        return "redirect:listProduct";
    }

}
