package POJOS;
// Generated 28-Jul-2016 14:47:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer iditem;
     private Color color;
     private Size size;
     private Subcat subcat;
     private String itemname;
     private Integer watching;
     private String description;
     private String url;
     private String delivary;
     private Integer status;
     private Set<Stock> stocks = new HashSet<Stock>(0);
     private Set<Grn> grns = new HashSet<Grn>(0);
     private Set<WatchList> watchLists = new HashSet<WatchList>(0);
     private Set<Cart> carts = new HashSet<Cart>(0);

    public Item() {
    }

	
    public Item(Color color, Size size, Subcat subcat) {
        this.color = color;
        this.size = size;
        this.subcat = subcat;
    }
    public Item(Color color, Size size, Subcat subcat, String itemname, Integer watching, String description, String url, String delivary, Integer status, Set<Stock> stocks, Set<Grn> grns, Set<WatchList> watchLists, Set<Cart> carts) {
       this.color = color;
       this.size = size;
       this.subcat = subcat;
       this.itemname = itemname;
       this.watching = watching;
       this.description = description;
       this.url = url;
       this.delivary = delivary;
       this.status = status;
       this.stocks = stocks;
       this.grns = grns;
       this.watchLists = watchLists;
       this.carts = carts;
    }
   
    public Integer getIditem() {
        return this.iditem;
    }
    
    public void setIditem(Integer iditem) {
        this.iditem = iditem;
    }
    public Color getColor() {
        return this.color;
    }
    
    public void setColor(Color color) {
        this.color = color;
    }
    public Size getSize() {
        return this.size;
    }
    
    public void setSize(Size size) {
        this.size = size;
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
    public Integer getWatching() {
        return this.watching;
    }
    
    public void setWatching(Integer watching) {
        this.watching = watching;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    public String getDelivary() {
        return this.delivary;
    }
    
    public void setDelivary(String delivary) {
        this.delivary = delivary;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Set<Stock> getStocks() {
        return this.stocks;
    }
    
    public void setStocks(Set<Stock> stocks) {
        this.stocks = stocks;
    }
    public Set<Grn> getGrns() {
        return this.grns;
    }
    
    public void setGrns(Set<Grn> grns) {
        this.grns = grns;
    }
    public Set<WatchList> getWatchLists() {
        return this.watchLists;
    }
    
    public void setWatchLists(Set<WatchList> watchLists) {
        this.watchLists = watchLists;
    }
    public Set<Cart> getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }




}


