package POJOS;
// Generated Nov 6, 2016 9:42:09 AM by Hibernate Tools 4.3.1



/**
 * PagesHasUtype generated by hbm2java
 */
public class PagesHasUtype  implements java.io.Serializable {


     private Integer idpagesHasUtype;
     private Pages pages;
     private Utype utype;

    public PagesHasUtype() {
    }

    public PagesHasUtype(Pages pages, Utype utype) {
       this.pages = pages;
       this.utype = utype;
    }
   
    public Integer getIdpagesHasUtype() {
        return this.idpagesHasUtype;
    }
    
    public void setIdpagesHasUtype(Integer idpagesHasUtype) {
        this.idpagesHasUtype = idpagesHasUtype;
    }
    public Pages getPages() {
        return this.pages;
    }
    
    public void setPages(Pages pages) {
        this.pages = pages;
    }
    public Utype getUtype() {
        return this.utype;
    }
    
    public void setUtype(Utype utype) {
        this.utype = utype;
    }




}

