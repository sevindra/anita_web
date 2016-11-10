package POJOS;
// Generated Nov 6, 2016 9:42:09 AM by Hibernate Tools 4.3.1



/**
 * CartItem generated by hbm2java
 */
public class CartItem  implements java.io.Serializable {


     private Integer idcartItem;
     private Cart cart;
     private Color color;
     private Item item;
     private Size size;
     private Stock stock;
     private Integer qty;
     private Double total;

    public CartItem() {
    }

	
    public CartItem(Cart cart, Color color, Item item, Size size, Stock stock) {
        this.cart = cart;
        this.color = color;
        this.item = item;
        this.size = size;
        this.stock = stock;
    }
    public CartItem(Cart cart, Color color, Item item, Size size, Stock stock, Integer qty, Double total) {
       this.cart = cart;
       this.color = color;
       this.item = item;
       this.size = size;
       this.stock = stock;
       this.qty = qty;
       this.total = total;
    }
   
    public Integer getIdcartItem() {
        return this.idcartItem;
    }
    
    public void setIdcartItem(Integer idcartItem) {
        this.idcartItem = idcartItem;
    }
    public Cart getCart() {
        return this.cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    public Color getColor() {
        return this.color;
    }
    
    public void setColor(Color color) {
        this.color = color;
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
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }
    public Integer getQty() {
        return this.qty;
    }
    
    public void setQty(Integer qty) {
        this.qty = qty;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }




}

