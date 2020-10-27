package com.roland;
public class Employee {
    private int id;
    private String firstName, secondname;

    public int getId() {
        return id;
    }

    public void setId(int id) {        
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondname() {
        return secondname;
    }

    public void setSecondname(String secondname) {
        this.secondname = secondname;
    }
}