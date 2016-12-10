package POJOS;
// Generated Dec 11, 2016 12:59:44 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Stock generated by hbm2java
 */
public class Stock  implements java.io.Serializable {


     private Integer idstock;
     private Color color;
     private Grn grn;
     private Item item;
     private Size size;
     private Double price;
     private Integer qty;
     private Integer avalQty;
     private Integer status;
     private Date date;
     private Date time;
     private Set<InvoiceItem> invoiceItems = new HashSet<InvoiceItem>(0);
     private Set<CartItem> cartItems = new HashSet<CartItem>(0);

    public Stock() {
    }

	
    public Stock(Color color, Grn grn, Item item, Size size) {
        this.color = color;
        this.grn = grn;
        this.item = item;
        this.size = size;
    }
    public Stock(Color color, Grn grn, Item item, Size size, Double price, Integer qty, Integer avalQty, Integer status, Date date, Date time, Set<InvoiceItem> invoiceItems, Set<CartItem> cartItems) {
       this.color = color;
       this.grn = grn;
       this.item = item;
       this.size = size;
       this.price = price;
       this.qty = qty;
       this.avalQty = avalQty;
       this.status = status;
       this.date = date;
       this.time = time;
       this.invoiceItems = invoiceItems;
       this.cartItems = cartItems;
    }
   
    public Integer getIdstock() {
        return this.idstock;
    }
    
    public void setIdstock(Integer idstock) {
        this.idstock = idstock;
    }
    public Color getColor() {
        return this.color;
    }
    
    public void setColor(Color color) {
        this.color = color;
    }
    public Grn getGrn() {
        return this.grn;
    }
    
    public void setGrn(Grn grn) {
        this.grn = grn;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }
    public Size getSize() {
        return this.size;
    }
    
    public void setSize(Size size) {
        this.size = size;
    }
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    public Integer getQty() {
        return this.qty;
    }
    
    public void setQty(Integer qty) {
        this.qty = qty;
    }
    public Integer getAvalQty() {
        return this.avalQty;
    }
    
    public void setAvalQty(Integer avalQty) {
        this.avalQty = avalQty;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
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
    public Set<InvoiceItem> getInvoiceItems() {
        return this.invoiceItems;
    }
    
    public void setInvoiceItems(Set<InvoiceItem> invoiceItems) {
        this.invoiceItems = invoiceItems;
    }
    public Set<CartItem> getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }




}


