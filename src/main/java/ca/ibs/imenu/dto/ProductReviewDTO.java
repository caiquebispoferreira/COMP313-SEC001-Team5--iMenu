package ca.ibs.imenu.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.entity.ProductReview;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ProductReviewDTO - this is a DTO representing PRODUCTREVIEWS table in iMenu database
 * Date 2021-02-28
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductReviewDTO {
	private Long id;
    private String userName;
    private int rating;
    private String notes;
    @JsonFormat(pattern = "MM/dd/yyyy")
    private LocalDate date;
    
    public ProductReviewDTO(ProductReview review) {
    	this.id = review.getId();
    	this.userName = review.getUserName();
    	this.rating = review.getRating();
    	this.notes = review.getNotes();
    	this.date = review.getDate();
    }
}
