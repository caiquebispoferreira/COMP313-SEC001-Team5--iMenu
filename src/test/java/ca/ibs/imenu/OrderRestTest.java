package ca.ibs.imenu;

import ca.ibs.imenu.service.OrderService;
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
public class OrderRestTest {
    @Autowired
    private OrderService orderService;

    @Test
    public void case001_getMonthProfitByDay() throws Exception {
        assertNotEquals(0, orderService.getMonthProfitByDay().size());
    }
}
