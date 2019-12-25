
/**
 * The class CartItem models an item in the Cart.
 * This class shall not be accessed by the controlling logic directly.
 * Instead Use Cart.add() or Cart.remove() to add or remove an item from the Cart.
 */
public class CartItem {

    private int id;
    private String category;
    private String seller;
    private float price;
    private int qtyOrdered;
// Constructor

    public CartItem(int id, String category,
            String seller, float price, int qtyOrdered) {
        this.id = id;
        this.category = category;
        this.seller = seller;
        this.price = price;
        this.qtyOrdered = qtyOrdered;
    }

    public int getId() {
        return id;
    }

    public String getSeller() {
        return seller;
    }

    public String getCategory() {
        return category;
    }

    public float getPrice() {
        return price;
    }

    public int getQtyOrdered() {
        return qtyOrdered;
    }

    public void setQtyOrdered(int qtyOrdered) {
        this.qtyOrdered = qtyOrdered;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
