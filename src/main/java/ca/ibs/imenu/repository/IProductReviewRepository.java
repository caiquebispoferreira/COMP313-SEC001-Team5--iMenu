package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.entity.ProductReview;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * IProductReviewRepository - repository used to persist, merge, delete, and search review
 * Date 2021-04-05
 *
 * @author Caique
 * @version 0.0.1
 */
@Repository
public interface IProductReviewRepository
        extends JpaRepository<ProductReview, Long>, PagingAndSortingRepository<ProductReview, Long>, JpaSpecificationExecutor<IProductReviewRepository> {    
}
