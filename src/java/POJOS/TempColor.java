package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1



/**
 * TempColor generated by hbm2java
 */
public class TempColor  implements java.io.Serializable {


     private Integer idtempColor;
     private String color;

    public TempColor() {
    }

    public TempColor(String color) {
       this.color = color;
    }
   
    public Integer getIdtempColor() {
        return this.idtempColor;
    }
    
    public void setIdtempColor(Integer idtempColor) {
        this.idtempColor = idtempColor;
    }
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }




}


