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
public class Planners {
    
    private int id=0;
    private String name="";
    private int price = 0;
    private String mobile="";
    private String address="";
    private String description="";

    public Planners() {
    }
    
    public Planners(int id,String name,int price,String mobile,String address,String description){
        this.description=description;
        this.id=id;
        this.mobile=mobile;
        this.price=price;
        this.name=name;
        this.address=address;
        
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
