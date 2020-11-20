package ca.ibs.imenu;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.ProductService;
import org.junit.*;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ProductTest {
	
	@Autowired
	private ProductService productService;
	
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
	@Order(1)
	public void case001_addProduct() throws Exception {
		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
				
		product = productService.save(product);
		Product productDB = productService.findById(product.getId());

		//Actual - Expected
		assertEquals(product.getName(), productDB.getName());
		assertEquals(product.getCategory(), productDB.getCategory());
		assertEquals(product.getUnitPrice(), productDB.getUnitPrice());
	}

	@Test
	@Order(2)
	public void case002_findAll() throws Exception {

		List<Product> products = productService.findAll();

		//Actual - Expected
		assertEquals("Pastel",products.get(0).getName());
	}

}