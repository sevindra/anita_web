package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Color generated by hbm2java
 */
public class Color  implements java.io.Serializable {


     private Integer idcolor;
     private Item item;
     private String color;
     private Set<CartItem> cartItems = new HashSet<CartItem>(0);
     private Set<Stock> stocks = new HashSet<Stock>(0);
     private Set<TempGrnItem> tempGrnItems = new HashSet<TempGrnItem>(0);

    public Color() {
    }

	
    public Color(Item item) {
        this.item = item;
    }
    public Color(Item item, String color, Set<CartItem> cartItems, Set<Stock> stocks, Set<TempGrnItem> tempGrnItems) {
       this.item = item;
       this.color = color;
       this.cartItems = cartItems;
       this.stocks = stocks;
       this.tempGrnItems = tempGrnItems;
    }
   
    public Integer getIdcolor() {
        return this.idcolor;
    }
    
    public void setIdcolor(Integer idcolor) {
        this.idcolor = idcolor;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }
    public Set<CartItem> getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
    public Set<Stock> getStocks() {
        return this.stocks;
    }
    
    public void setStocks(Set<Stock> stocks) {
        this.stocks = stocks;
    }
    public Set<TempGrnItem> getTempGrnItems() {
        return this.tempGrnItems;
    }
    
    public void setTempGrnItems(Set<TempGrnItem> tempGrnItems) {
        this.tempGrnItems = tempGrnItems;
    }




}


