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

@Service
public class ProductReviewService {
    @Autowired
    private IProductReviewRepository repository;

    public ProductReview save(ProductReview review){
        return repository.save(review);
    }

    public void delete(ProductReview review){
        repository.delete(review);
    }

    public ProductReview findById(Long id) {
        Optional<ProductReview> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }
}
