package com.roland;

import org.junit.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

public class StoreTest {
    @Test
    public void testFindAllEmployee() {
        Store store = new Store();
        List a = store.findAllEmployee();
        System.out.println(a.size());
        for (int i=0; i<a.size(); i++){
            Employee get = (Employee) a.get(i);
            System.out.println("NUMBER::"+get.getId()+"\n Name::" + get.getFirstName()+ "     "+ get.getSecondname());
        }
        store.close();
    }

    @Test
    public void testclear(){
        Store store = new Store();
        store.clear();
        assertEquals(0, store.findAllEmployee().size());
    }

    @Test
    public void testInsertField() {
        Store store = new Store();
        store.clear();
    }
}