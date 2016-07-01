package POJOS;
// Generated Jun 21, 2016 7:38:20 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Addres generated by hbm2java
 */
public class Addres  implements java.io.Serializable {


     private Integer idaddres;
     private State state;
     private String address;
     private String city;
     private String state_1;
     private String zip;
     private Integer primaryAddress;
     private Integer status;
     private Set users = new HashSet(0);

    public Addres() {
    }

	
    public Addres(State state) {
        this.state = state;
    }
    public Addres(State state, String address, String city, String state_1, String zip, Integer primaryAddress, Integer status, Set users) {
       this.state = state;
       this.address = address;
       this.city = city;
       this.state_1 = state_1;
       this.zip = zip;
       this.primaryAddress = primaryAddress;
       this.status = status;
       this.users = users;
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
    public String getState_1() {
        return this.state_1;
    }
    
    public void setState_1(String state_1) {
        this.state_1 = state_1;
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
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


