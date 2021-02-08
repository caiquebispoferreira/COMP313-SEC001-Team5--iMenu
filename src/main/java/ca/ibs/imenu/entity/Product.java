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

    @OneToMany(mappedBy ="product",cascade = CascadeType.PERSIST)
    private List<ProductReview> reviews;

    public void addReview(ProductReview review){
        this.reviews = this.reviews==null? new ArrayList():reviews;
        review.setProduct(this);
        this.reviews.add(review);
    }

}
