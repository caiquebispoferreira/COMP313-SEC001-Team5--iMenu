package ca.ibs.imenu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Product - this is an entity representing PRODUCTS table in iMenu database
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "PRODUCTS")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private BigDecimal unitPrice;
    private Boolean enabled;
    @Enumerated(EnumType.STRING)
    private Category category;
    private boolean hasImage;

    @OneToMany(mappedBy ="product",cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private List<ProductReview> reviews = new ArrayList<ProductReview>();

    /**
 	 * addReview - add the review to the product
 	 * Date 2021-04-04
 	 *
 	 * @param review - representing review that is added to the product
 	 */
    public void addReview(ProductReview review){
        this.reviews = this.reviews==null? new ArrayList():reviews;
        review.setProduct(this);
        this.reviews.add(review);
    }

}
