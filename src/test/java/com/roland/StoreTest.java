package com.roland;

import fr.roland.DB.Executor;
import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
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

//    @Test
    public void testGetTables() {
        Store store = new Store();
        assertNotEquals(null, store.getTables());
    }

    @Test
    public void JDBCTest() throws SQLException {
        String url = "jdbc:postgresql://localhost/testdb?user=user2&password=123";
        Executor exec = new Executor(url);
        assertNotEquals(null, exec.getConn());
    }
    
    @Test
    public void simpleTest() {
    	assertEquals(1,1);
    }

    @Test
    public void getTables() throws SQLException {
        String url = "jdbc:postgresql://localhost/testdb?user=user2&password=123";///&ssl=true";
        Executor exec = new Executor(url);
        ResultSet Select2 = null;
        try {
            Select2 = exec.submit( "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            while (Select2.next()){
                String res =Select2.getString("table_name");
                System.out.println(res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}