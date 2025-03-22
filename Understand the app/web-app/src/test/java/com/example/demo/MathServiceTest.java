package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class MathServiceTest {

    @Autowired
    private MathService mathService;

    @Test
    void testAddition() {
        int result = mathService.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    void testSubtraction() {
        int result = mathService.subtract(5, 3);
        assertEquals(2, result, "5 - 3 should equal 2");
    }

    @Test
    void testMultiplication() {
        int result = mathService.multiply(4, 6);
        assertEquals(24, result, "4 * 6 should equal 24");
    }

    @Test
    void testDivision() {
        int result = mathService.divide(8, 4);
        assertEquals(2, result, "8 / 4 should equal 2");
    }

    @Test
    void testDivisionByZero() {
        assertThrows(IllegalArgumentException.class, () -> mathService.divide(10, 0),
                "Dividing by zero should throw IllegalArgumentException");
    }
}

