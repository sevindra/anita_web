package POJOS;
// Generated Jun 8, 2016 10:20:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer iditem;
     private Subcat subcat;
     private String itemname;
     private String status;
     private Set stocks = new HashSet(0);
     private Set grnRegs = new HashSet(0);

    public Item() {
    }

	
    public Item(Subcat subcat) {
        this.subcat = subcat;
    }
    public Item(Subcat subcat, String itemname, String status, Set stocks, Set grnRegs) {
       this.subcat = subcat;
       this.itemname = itemname;
       this.status = status;
       this.stocks = stocks;
       this.grnRegs = grnRegs;
    }
   
    public Integer getIditem() {
        return this.iditem;
    }
    
    public void setIditem(Integer iditem) {
        this.iditem = iditem;
    }
    public Subcat getSubcat() {
        return this.subcat;
    }
    
    public void setSubcat(Subcat subcat) {
        this.subcat = subcat;
    }
    public String getItemname() {
        return this.itemname;
    }
    
    public void setItemname(String itemname) {
        this.itemname = itemname;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Set getStocks() {
        return this.stocks;
    }
    
    public void setStocks(Set stocks) {
        this.stocks = stocks;
    }
    public Set getGrnRegs() {
        return this.grnRegs;
    }
    
    public void setGrnRegs(Set grnRegs) {
        this.grnRegs = grnRegs;
    }




}


