package POJOS;
// Generated Nov 6, 2016 9:42:09 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Advertisement generated by hbm2java
 */
public class Advertisement  implements java.io.Serializable {


     private Integer idadvertisement;
     private String page;
     private String url;
     private Date datetime;

    public Advertisement() {
    }

    public Advertisement(String page, String url, Date datetime) {
       this.page = page;
       this.url = url;
       this.datetime = datetime;
    }
   
    public Integer getIdadvertisement() {
        return this.idadvertisement;
    }
    
    public void setIdadvertisement(Integer idadvertisement) {
        this.idadvertisement = idadvertisement;
    }
    public String getPage() {
        return this.page;
    }
    
    public void setPage(String page) {
        this.page = page;
    }
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    public Date getDatetime() {
        return this.datetime;
    }
    
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }




}


