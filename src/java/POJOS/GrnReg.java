package POJOS;
// Generated 02-Jul-2016 15:04:48 by Hibernate Tools 4.3.1



/**
 * GrnReg generated by hbm2java
 */
public class GrnReg  implements java.io.Serializable {


     private Integer idgrnReg;
     private Grn grn;
     private Item item;
     private Stock stock;
     private Integer qty;
     private Double cost;
     private Integer discount;
     private Double total;

    public GrnReg() {
    }

	
    public GrnReg(Grn grn, Item item, Stock stock) {
        this.grn = grn;
        this.item = item;
        this.stock = stock;
    }
    public GrnReg(Grn grn, Item item, Stock stock, Integer qty, Double cost, Integer discount, Double total) {
       this.grn = grn;
       this.item = item;
       this.stock = stock;
       this.qty = qty;
       this.cost = cost;
       this.discount = discount;
       this.total = total;
    }
   
    public Integer getIdgrnReg() {
        return this.idgrnReg;
    }
    
    public void setIdgrnReg(Integer idgrnReg) {
        this.idgrnReg = idgrnReg;
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
    public Double getCost() {
        return this.cost;
    }
    
    public void setCost(Double cost) {
        this.cost = cost;
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


