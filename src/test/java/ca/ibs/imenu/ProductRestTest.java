package ca.ibs.imenu;

import ca.ibs.imenu.service.ProductService;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertNotEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductRestTest {
    @Autowired
    private ProductService productService;

    @Test
    public void case001_findTopSoldProducts() throws Exception {
        assertNotEquals(0, productService.findTopSoldProducts().size());
    }

    @Test
    public void case002_findLessSoldProducts() throws Exception {
        assertNotEquals(0, productService.findLessSoldProducts().size());
    }
}
