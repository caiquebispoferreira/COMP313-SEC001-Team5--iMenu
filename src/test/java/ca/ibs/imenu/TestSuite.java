package ca.ibs.imenu;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(Suite.class)
@SuiteClasses({UserTest.class, ProductTest.class, OrderTest.class,ProductRestTest.class,OrderRestTest.class})
public class TestSuite {

}
