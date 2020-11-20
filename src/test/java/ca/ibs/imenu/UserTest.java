package ca.ibs.imenu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.jsonPath;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.*;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.UserService;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserTest {
	
	@Autowired
	private UserService userService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}
	
	@Before
	public void setup() {
	}

	@After
	public void tearDown() throws Exception {
	}
		
	@Test
	public void case001_findAll() throws Exception {
		if (userService.findAll().size()==0){
			User user = new User();
			user.setName("admin");
			user.setRole(Role.ADMINISTRATOR);
			user.setPassword("1");
			user.setUsername("admin");
			userService.save(user);
		}

		List<User> users = userService.findAll();
		//Expected - Actual
		assertEquals("admin",users.get(0).getUsername());
		assertEquals(Role.ADMINISTRATOR,users.get(0).getRole());
	}
	
	@Test
	public void case002_getUser() throws Exception {
		User userDB = userService.findByUsername("admin");
		
		//Expected - Actual
		assertEquals("admin", userDB.getUsername());
	}

	
	@Test
	public void case003_addUser() throws Exception {
		User user = new User(); 
		user.setName("staff");
		user.setRole(Role.STAFF);
		user.setPassword("1");
		user.setUsername("staff");
				
		user = userService.save(user);
		User userDB = userService.findByUsername(user.getUsername());
		
		//Expected - Actual
		assertEquals(user.getName(), userDB.getName());
		assertEquals(user.getRole(), userDB.getRole());
		assertEquals(user.getUsername(), userDB.getUsername());
	}

	@Test
	public void case004_editUser() throws Exception {

		User user = userService.findByUsername("staff");
		user.setName("Staff");
		user  = userService.save(user);
		//Expected - Actual
		assertEquals("Staff", user.getName());

	}
	
	@Test
	public void case005_removeUser() throws Exception {
		userService.delete( userService.findByUsername("staff"));
		//Expected - Actual
		assertEquals(null, userService.findByUsername("staff"));
	}

}
