import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
       
        calculator = new Calculator();
        System.out.println("Setup complete");
    }

    @After
    public void tearDown() {
        
        calculator = null;
        System.out.println("Teardown complete");
    }

    @Test
    public void testAddition() {
       
        int a = 10, b = 5;
        int result = calculator.add(a, b);
        assertEquals(15, result);
    }

    @Test
    public void testSubtraction() {
      
        int a = 10, b = 3;
        int result = calculator.subtract(a, b);
        assertEquals(7, result);
    }
}

class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
    public int subtract(int a, int b) {
        return a - b;
    }
}
