package ca.ibs.imenu;

import ca.ibs.imenu.entity.*;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;
import org.hibernate.Hibernate;
import org.junit.*;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OrderTest {

	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	
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
		if (orderService.findAll().size()==0){
			Order order = new Order();
			order.setDate(LocalDate.now());
			order.setStatus(Status.CONFIRMED);
			order.setNote("Special notes");
			order.setTableNumber(1);

			Product product = new Product();
			product.setName("Pastel");
			product.setDescription("Appetizer from Brazil");
			product.setUnitPrice(BigDecimal.valueOf(5));
			product.setEnabled(true);
			product.setCategory(Category.APPETIZER);
			product.setHasImage(false);
			product = productService.save(product);

			OrderItem o = new OrderItem();
			o.setProduct(product);
			o.setQuantity(1);
			o.setUnitPrice(product.getUnitPrice());
			order.addItem(o);
			orderService.save(order);
		}

		List<Order> orders = orderService.findAll();
		//Expected - Actual
		assertEquals(1,orders.get(0).getTableNumber());
		assertEquals(Status.CONFIRMED,orders.get(0).getStatus());
		assertEquals("Special notes",orders.get(0).getNote());
	}
	
	@Test
	public void case002_getOrder() throws Exception {
		Order orderDB = orderService.findByStatusAndTableNumber(1);
		
		//Expected - Actual
		assertEquals(1,orderDB.getTableNumber());
		assertEquals(Status.CONFIRMED,orderDB.getStatus());
		assertEquals("Special notes",orderDB.getNote());
	}
	
	@Test
	@Transactional
	public void case003_addOrder() throws Exception {
		Order order = new Order();
		order.setDate(LocalDate.now());
		order.setStatus(Status.CONFIRMED);
		order.setNote("Special notes");
		order.setTableNumber(2);
		order.setItems(new ArrayList<>());

		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(false);
		product = productService.save(product);

		OrderItem o = new OrderItem();
		o.setProduct(product);
		o.setQuantity(1);
		o.setUnitPrice(product.getUnitPrice());
		order.addItem(o);
		orderService.save(order);

		Order orderDB = orderService.findByStatusAndTableNumber(2);

		//Expected - Actual
		assertEquals(2,orderDB.getTableNumber());
		assertEquals(Status.CONFIRMED,orderDB.getStatus());
		assertEquals("Special notes",orderDB.getNote());
		assertEquals(product.getName(),orderDB.getItems().get(0).getProduct().getName());
	}

	@Transactional
	@Test
	public void case004_editOrder() throws Exception {
		Order order = new Order();
		order.setDate(LocalDate.now());
		order.setStatus(Status.CONFIRMED);
		order.setNote("Special notes");
		order.setTableNumber(3);
		order.setItems(new ArrayList<>());

		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(false);
		product = productService.save(product);

		OrderItem o = new OrderItem();
		o.setProduct(product);
		o.setQuantity(1);
		o.setUnitPrice(product.getUnitPrice());
		order.addItem(o);
		orderService.save(order);

		order = orderService.findByStatusAndTableNumber(3);
		order.setStatus(Status.DELIVERED);
		order  = orderService.save(order);

		Order orderDB = orderService.findByStatusAndTableNumber(3);
		//Expected - Actual
		assertEquals(Status.DELIVERED, orderDB.getStatus());
	}

	@Transactional
	@Test
	public void case005_removeOrder() throws Exception {
		Order order = new Order();
		order.setDate(LocalDate.now());
		order.setStatus(Status.CONFIRMED);
		order.setNote("Special notes");
		order.setTableNumber(5);
		order.setItems(new ArrayList<>());

		Product product = new Product();
		product.setName("Pastel");
		product.setDescription("Appetizer from Brazil");
		product.setUnitPrice(BigDecimal.valueOf(5));
		product.setEnabled(true);
		product.setCategory(Category.APPETIZER);
		product.setHasImage(false);
		product = productService.save(product);

		OrderItem o = new OrderItem();
		o.setProduct(product);
		o.setQuantity(1);
		o.setUnitPrice(product.getUnitPrice());
		order.addItem(o);
		orderService.save(order);

		orderService.delete( orderService.findByStatusAndTableNumber(5));
		//Expected - Actual
		assertEquals(null, orderService.findByStatusAndTableNumber(5));
	}

}
