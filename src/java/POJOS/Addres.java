package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1



/**
 * Addres generated by hbm2java
 */
public class Addres  implements java.io.Serializable {


     private Integer idaddres;
     private State state;
     private User user;
     private String address;
     private String city;
     private String zip;
     private Integer primaryAddress;
     private Integer status;

    public Addres() {
    }

	
    public Addres(State state, User user) {
        this.state = state;
        this.user = user;
    }
    public Addres(State state, User user, String address, String city, String zip, Integer primaryAddress, Integer status) {
       this.state = state;
       this.user = user;
       this.address = address;
       this.city = city;
       this.zip = zip;
       this.primaryAddress = primaryAddress;
       this.status = status;
    }
   
    public Integer getIdaddres() {
        return this.idaddres;
    }
    
    public void setIdaddres(Integer idaddres) {
        this.idaddres = idaddres;
    }
    public State getState() {
        return this.state;
    }
    
    public void setState(State state) {
        this.state = state;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    public String getZip() {
        return this.zip;
    }
    
    public void setZip(String zip) {
        this.zip = zip;
    }
    public Integer getPrimaryAddress() {
        return this.primaryAddress;
    }
    
    public void setPrimaryAddress(Integer primaryAddress) {
        this.primaryAddress = primaryAddress;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }




}


