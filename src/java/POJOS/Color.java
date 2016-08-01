package POJOS;
// Generated 28-Jul-2016 14:47:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Color generated by hbm2java
 */
public class Color  implements java.io.Serializable {


     private Integer idcolor;
     private String color;
     private Set<Item> items = new HashSet<Item>(0);
     private Set<Cart> carts = new HashSet<Cart>(0);

    public Color() {
    }

    public Color(String color, Set<Item> items, Set<Cart> carts) {
       this.color = color;
       this.items = items;
       this.carts = carts;
    }
   
    public Integer getIdcolor() {
        return this.idcolor;
    }
    
    public void setIdcolor(Integer idcolor) {
        this.idcolor = idcolor;
    }
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }
    public Set<Item> getItems() {
        return this.items;
    }
    
    public void setItems(Set<Item> items) {
        this.items = items;
    }
    public Set<Cart> getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }




}

