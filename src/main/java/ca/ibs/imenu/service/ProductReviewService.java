package ca.ibs.imenu.service;


import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.entity.ProductReview;
import ca.ibs.imenu.repository.IOrderItemRepository;
import ca.ibs.imenu.repository.IOrderRepository;
import ca.ibs.imenu.repository.IProductReviewRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * ProductReviewService - this service class handles requests to save/delete/find review
 * 
 * Date 2021-04-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class ProductReviewService {
    @Autowired
    private IProductReviewRepository repository;

    /**
	 * save - save review
	 * Date 2021-04-04
	 *
	 * @param review - review to be saved
	 */
    public ProductReview save(ProductReview review){
        return repository.save(review);
    }

    /**
	 * delete - delete review
	 * Date 2021-04-04
	 *
	 * @param review - review to be deleted
	 */
    public void delete(ProductReview review){
        repository.delete(review);
    }

    /**
 	 * findById - find review by id
 	 * Date 2021-04-04
 	 *
 	 * @param id - id of the review
 	 * @return review found in the repository (if found)
 	 */
    public ProductReview findById(Long id) {
        Optional<ProductReview> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }
}
