package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * IProductReviewRepository - repository used to persist, merge, delete, and search user
 * Date 2020-12-08
 *
 * @author Caique
 * @version 0.0.1
 */
@Repository
public interface IUserRepository
        extends JpaRepository<User, Long>, PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<IUserRepository> {
    User findByUsername(String username);
}
