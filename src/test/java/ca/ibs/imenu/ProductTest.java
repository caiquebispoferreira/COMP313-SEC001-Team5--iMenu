package ca.ibs.imenu;

import ca.ibs.imenu.entity.Category;
import ca.ibs.imenu.entity.Product;
import ca.ibs.imenu.entity.Role;
import ca.ibs.imenu.entity.User;
import ca.ibs.imenu.service.ProductService;
import org.junit.*;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.math.BigDecimal;
import java.util.*;

import org.springframework.util.Assert;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductTest {

	@Test
	public void case001_findAll() throws Exception {
		//first product
		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5.99));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
		product = productService.save(product);

		List<Product> productsDB = productService.findAll();

		//Expected - Actual
		assertEquals(product,productsDB.get(0));
	}

	@Test
	public void case002_addProduct() throws Exception {
		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5.99));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
				
		product = productService.save(product);
		Product productDB = productService.findById(product.getId());

		//Actual - Expected
		//Assert.hasText("Pastel", productDB.getName() );
		assertEquals(product, productDB);
	}

	@Test
	public void case003_findById() throws Exception {
		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5.99));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
		product = productService.save(product);
		Product productDB = productService.findById(product.getId());

		//Actual - Expected
		assertEquals(productDB, product);
		//assertEquals(product.getId(), productDB.getId());

	}

	@Test
	public void case004_findByCategory() throws Exception {
		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5.00));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
		product = productService.save(product);
		Product productDB = productService.findById(product.getId());

		//Actual - Expected
		assertEquals(product.getCategory(), productDB.getCategory());

	}

	@Test
	public void case005_delete() throws Exception {
		Product product = new Product();
		product.setName("ToBeDeleted");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5.00));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(true);
		product = productService.save(product);
		productService.delete(product);

		assertNull(productService.findById(product.getId()));
	}



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

}

