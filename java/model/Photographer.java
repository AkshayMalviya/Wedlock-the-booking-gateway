package model;

public class Photographer {

    private int id=0;
    
    private String name="";
    private String studioName="";
    private float price=0;
    private String description="";

    public Photographer() {
    }
    
    public Photographer(int id,String name,String studioName,float price,String description){
        
        this.description=description;
        this.id=id;
        this.name=name;
        this.price=price;
        this.studioName=studioName;
        
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

   
    public String getStudioName() {
        return studioName;
    }

    public void setStudioName(String studioName) {
        this.studioName = studioName;
    }



    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
