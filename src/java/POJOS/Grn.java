package POJOS;
// Generated Oct 16, 2016 2:02:03 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Grn generated by hbm2java
 */
public class Grn  implements java.io.Serializable {


     private Integer grnid;
     private Supplier supplier;
     private String grnidreal;
     private Date deteTime;
     private Double total;
     private Integer status;
     private Set<GrnItem> grnItems = new HashSet<GrnItem>(0);
     private Set<Stock> stocks = new HashSet<Stock>(0);

    public Grn() {
    }

	
    public Grn(Supplier supplier, String grnidreal) {
        this.supplier = supplier;
        this.grnidreal = grnidreal;
    }
    public Grn(Supplier supplier, String grnidreal, Date deteTime, Double total, Integer status, Set<GrnItem> grnItems, Set<Stock> stocks) {
       this.supplier = supplier;
       this.grnidreal = grnidreal;
       this.deteTime = deteTime;
       this.total = total;
       this.status = status;
       this.grnItems = grnItems;
       this.stocks = stocks;
    }
   
    public Integer getGrnid() {
        return this.grnid;
    }
    
    public void setGrnid(Integer grnid) {
        this.grnid = grnid;
    }
    public Supplier getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
    public String getGrnidreal() {
        return this.grnidreal;
    }
    
    public void setGrnidreal(String grnidreal) {
        this.grnidreal = grnidreal;
    }
    public Date getDeteTime() {
        return this.deteTime;
    }
    
    public void setDeteTime(Date deteTime) {
        this.deteTime = deteTime;
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
    public Set<GrnItem> getGrnItems() {
        return this.grnItems;
    }
    
    public void setGrnItems(Set<GrnItem> grnItems) {
        this.grnItems = grnItems;
    }
    public Set<Stock> getStocks() {
        return this.stocks;
    }
    
    public void setStocks(Set<Stock> stocks) {
        this.stocks = stocks;
    }




}


