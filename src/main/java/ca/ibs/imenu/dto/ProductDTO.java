package ca.ibs.imenu.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.entity.ProductReview;
import ca.ibs.imenu.entity.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private Long id;
    private String name;
    private String description;
    private BigDecimal unitPrice;
    private Boolean enabled;
    @Enumerated(EnumType.STRING)
    private Category category;
    private boolean hasImage;
    private List<ProductReviewDTO> reviews  = new ArrayList<>();
    
    public ProductDTO(Product product) {
    	this.id = product.getId();
        this.name = product.getName();
        this.description = product.getDescription();
        this.unitPrice = product.getUnitPrice();
        this.enabled  = product.getEnabled();
        this.category = product.getCategory();
        this.hasImage  = product.isHasImage();
        
        if (product.getReviews()!=null) {
        	for(ProductReview review : product.getReviews()) {
            	addItem(new ProductReviewDTO(review));
            }	
        }
    
        
    }
    
    public void addItem(ProductReviewDTO item) {
    	reviews.add(item);
    }
  
}
