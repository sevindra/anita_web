package POJOS;
// Generated 28-Jul-2016 14:47:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Subcat generated by hbm2java
 */
public class Subcat  implements java.io.Serializable {


     private Integer idsubcat;
     private Cat cat;
     private String subname;
     private Integer status;
     private Set<Item> items = new HashSet<Item>(0);

    public Subcat() {
    }

	
    public Subcat(Cat cat) {
        this.cat = cat;
    }
    public Subcat(Cat cat, String subname, Integer status, Set<Item> items) {
       this.cat = cat;
       this.subname = subname;
       this.status = status;
       this.items = items;
    }
   
    public Integer getIdsubcat() {
        return this.idsubcat;
    }
    
    public void setIdsubcat(Integer idsubcat) {
        this.idsubcat = idsubcat;
    }
    public Cat getCat() {
        return this.cat;
    }
    
    public void setCat(Cat cat) {
        this.cat = cat;
    }
    public String getSubname() {
        return this.subname;
    }
    
    public void setSubname(String subname) {
        this.subname = subname;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Set<Item> getItems() {
        return this.items;
    }
    
    public void setItems(Set<Item> items) {
        this.items = items;
    }




}


