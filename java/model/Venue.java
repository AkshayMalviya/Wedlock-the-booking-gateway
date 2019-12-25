/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Aakash
 */
public class Venue {
    
    private int id =0;
    private String name="";
    private int area = 0;
    private int capacity =0;
    private int price;
    private String mobile="";
    private String decription="";
    
    public Venue(){
        
    }
    
    public Venue(int id,String name,int area,int capacity,int price,String mobile,String description){
        
        this.area=area;
        this.capacity=capacity;
        this.decription=description;
        this.id=id;
        this.price=price;
        this.name=name;
        this.mobile=mobile;
        
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }
    
    
    
}
