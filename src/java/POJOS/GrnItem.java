package POJOS;
// Generated Nov 6, 2016 9:42:09 AM by Hibernate Tools 4.3.1



/**
 * GrnItem generated by hbm2java
 */
public class GrnItem  implements java.io.Serializable {


     private Integer idgrnItem;
     private Grn grn;
     private Item item;
     private Double cost;
     private Integer qty;
     private Integer discount;
     private Double total;
     private Integer status;

    public GrnItem() {
    }

	
    public GrnItem(Grn grn, Item item) {
        this.grn = grn;
        this.item = item;
    }
    public GrnItem(Grn grn, Item item, Double cost, Integer qty, Integer discount, Double total, Integer status) {
       this.grn = grn;
       this.item = item;
       this.cost = cost;
       this.qty = qty;
       this.discount = discount;
       this.total = total;
       this.status = status;
    }
   
    public Integer getIdgrnItem() {
        return this.idgrnItem;
    }
    
    public void setIdgrnItem(Integer idgrnItem) {
        this.idgrnItem = idgrnItem;
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
    public Double getCost() {
        return this.cost;
    }
    
    public void setCost(Double cost) {
        this.cost = cost;
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
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }




}


