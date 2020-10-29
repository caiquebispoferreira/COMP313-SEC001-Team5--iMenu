package ca.ibs.imenu.service;

import ca.ibs.imenu.repository.IUserRepository;
import com.smartmeeting.auth.model.Funcionario;
import com.smartmeeting.auth.repository.FuncionarioRepository;
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

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private IUserRepository userRepository;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findBy(username);

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

		return new org.springframework.security.core.userdetails.User(funcionario.getUsername(),
				funcionario.getPassword(), grantedAuthorities);
	}
}
