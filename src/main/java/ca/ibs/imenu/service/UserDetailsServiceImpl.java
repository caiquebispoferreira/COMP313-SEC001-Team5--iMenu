package ca.ibs.imenu.service;

import ca.ibs.imenu.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

/**
 * UserDetailsServiceImpl - this service implements spring framework to inject the user in the session
 * 
 * Date 2021-04-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private IUserRepository userRepository;

   /**
  	 * loadUserByUsername - load user by username 
  	 * Date 2020-12-04
  	 *
  	 * @param username - username to be loaded
  	 * @return user details 
  	*/
	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		ca.ibs.imenu.entity.User user = userRepository.findByUsername(username);
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		return new org.springframework.security.core.userdetails.User(user.getUsername(),
				user.getPassword(), grantedAuthorities);
	}
}
