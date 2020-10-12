package ca.ibs.imenu.repository;

import ca.ibs.imenu.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserRepository
        extends JpaRepository<User, Long>, PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<IUserRepository> {
}
