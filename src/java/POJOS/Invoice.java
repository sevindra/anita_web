package POJOS;
// Generated Dec 11, 2016 12:59:44 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Invoice generated by hbm2java
 */
public class Invoice  implements java.io.Serializable {


     private Integer idinvoice;
     private User user;
     private String invoiceNo;
     private Date date;
     private Date time;
     private Double total;

    public Invoice() {
    }

	
    public Invoice(User user) {
        this.user = user;
    }
    public Invoice(User user, String invoiceNo, Date date, Date time, Double total) {
       this.user = user;
       this.invoiceNo = invoiceNo;
       this.date = date;
       this.time = time;
       this.total = total;
    }
   
    public Integer getIdinvoice() {
        return this.idinvoice;
    }
    
    public void setIdinvoice(Integer idinvoice) {
        this.idinvoice = idinvoice;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getInvoiceNo() {
        return this.invoiceNo;
    }
    
    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }




}


