package POJOS;
// Generated 02-Jul-2016 15:04:48 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Stock generated by hbm2java
 */
public class Stock  implements java.io.Serializable {


     private Integer idstock;
     private Item item;
     private String itemCode;
     private Double price;
     private Integer qty;
     private Integer status;
     private Set grnRegs = new HashSet(0);

    public Stock() {
    }

	
    public Stock(Item item) {
        this.item = item;
    }
    public Stock(Item item, String itemCode, Double price, Integer qty, Integer status, Set grnRegs) {
       this.item = item;
       this.itemCode = itemCode;
       this.price = price;
       this.qty = qty;
       this.status = status;
       this.grnRegs = grnRegs;
    }
   
    public Integer getIdstock() {
        return this.idstock;
    }
    
    public void setIdstock(Integer idstock) {
        this.idstock = idstock;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }
    public String getItemCode() {
        return this.itemCode;
    }
    
    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
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
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Set getGrnRegs() {
        return this.grnRegs;
    }
    
    public void setGrnRegs(Set grnRegs) {
        this.grnRegs = grnRegs;
    }




}


