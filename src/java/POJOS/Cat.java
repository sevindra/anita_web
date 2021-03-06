package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cat generated by hbm2java
 */
public class Cat  implements java.io.Serializable {


     private Integer idcat;
     private String catname;
     private Integer status;
     private Set<Subcat> subcats = new HashSet<Subcat>(0);

    public Cat() {
    }

    public Cat(String catname, Integer status, Set<Subcat> subcats) {
       this.catname = catname;
       this.status = status;
       this.subcats = subcats;
    }
   
    public Integer getIdcat() {
        return this.idcat;
    }
    
    public void setIdcat(Integer idcat) {
        this.idcat = idcat;
    }
    public String getCatname() {
        return this.catname;
    }
    
    public void setCatname(String catname) {
        this.catname = catname;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Set<Subcat> getSubcats() {
        return this.subcats;
    }
    
    public void setSubcats(Set<Subcat> subcats) {
        this.subcats = subcats;
    }




}


