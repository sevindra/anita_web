package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1



/**
 * Slider generated by hbm2java
 */
public class Slider  implements java.io.Serializable {


     private Integer idslider;
     private String url;

    public Slider() {
    }

    public Slider(String url) {
       this.url = url;
    }
   
    public Integer getIdslider() {
        return this.idslider;
    }
    
    public void setIdslider(Integer idslider) {
        this.idslider = idslider;
    }
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }




}


