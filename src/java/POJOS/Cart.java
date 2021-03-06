package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Cart generated by hbm2java
 */
public class Cart  implements java.io.Serializable {


     private Integer idcart;
     private User user;
     private Double total;
     private Date date;
     private Date time;
     private Set<CartItem> cartItems = new HashSet<CartItem>(0);

    public Cart() {
    }

	
    public Cart(User user) {
        this.user = user;
    }
    public Cart(User user, Double total, Date date, Date time, Set<CartItem> cartItems) {
       this.user = user;
       this.total = total;
       this.date = date;
       this.time = time;
       this.cartItems = cartItems;
    }
   
    public Integer getIdcart() {
        return this.idcart;
    }
    
    public void setIdcart(Integer idcart) {
        this.idcart = idcart;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }
    public Set<CartItem> getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }




}


