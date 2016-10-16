package POJOS;
// Generated Oct 16, 2016 2:02:03 PM by Hibernate Tools 4.3.1



/**
 * TempGrnItem generated by hbm2java
 */
public class TempGrnItem  implements java.io.Serializable {


     private Integer idtempGrnItem;
     private Color color;
     private Item item;
     private Size size;
     private Double cost;
     private Double price;
     private Integer qty;
     private Integer discount;
     private Double total;

    public TempGrnItem() {
    }

	
    public TempGrnItem(Color color, Item item, Size size) {
        this.color = color;
        this.item = item;
        this.size = size;
    }
    public TempGrnItem(Color color, Item item, Size size, Double cost, Double price, Integer qty, Integer discount, Double total) {
       this.color = color;
       this.item = item;
       this.size = size;
       this.cost = cost;
       this.price = price;
       this.qty = qty;
       this.discount = discount;
       this.total = total;
    }
   
    public Integer getIdtempGrnItem() {
        return this.idtempGrnItem;
    }
    
    public void setIdtempGrnItem(Integer idtempGrnItem) {
        this.idtempGrnItem = idtempGrnItem;
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
    public Double getCost() {
        return this.cost;
    }
    
    public void setCost(Double cost) {
        this.cost = cost;
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
    public Integer getDiscount() {
        return this.discount;
    }
    
    public void setDiscount(Integer discount) {
        this.discount = discount;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }




}


