package ca.ibs.imenu.service;

import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * UserService - this service class handles requests to save/delete/find user
 * 
 * Date 2021-04-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class UserService {
    @Autowired
    private IUserRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
  	 * save - save user
  	 * Date 2020-12-04
  	 *
  	 * @param user - user to be saved
  	 * @return user that is saved in the repository
  	 */
    public User save(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return repository.save(user);
    }

    /**
  	 * delete - delete user
  	 * Date 2020-12-04
  	 *
  	 * @param user - user to be deleted
  	 */
    public void delete(User user){
        repository.delete(user);
    }

    /**
   	 * findById - find user by id
   	 * Date 2020-12-04
   	 *
   	 * @param id - id of the user to be found
   	 * @return user found in the repository (if found)
   	 */
    public User findById(Long id) {
        Optional<User> item = repository.findById(id);
        return item.isPresent()?item.get():null;
    }

    /**
   	 * findByUsername - find user by username
   	 * Date 2020-12-04
   	 *
   	 * @param username - username of the user to be found
   	 * @return user found in the repository (if found)
   	 */
    public User findByUsername(String username){
        return repository.findByUsername(username);
    }

    /**
   	 * findAll - find users of repository
   	 * Date 2020-12-04
   	 *
   	 * @return list of users returned from repository 
   	 */
    public List<User> findAll(){
        return repository.findAll();
    }
}
