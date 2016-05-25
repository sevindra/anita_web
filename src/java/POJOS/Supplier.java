package POJOS;
// Generated May 7, 2016 1:07:55 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Supplier generated by hbm2java
 */
public class Supplier  implements java.io.Serializable {


     private Integer idsupplier;
     private String supname;
     private String comname;
     private Integer contact1;
     private Integer contact2;
     private String email;
     private String address1;
     private String address2;
     private String address3;
     private Set grns = new HashSet(0);

    public Supplier() {
    }

    public Supplier(String supname, String comname, Integer contact1, Integer contact2, String email, String address1, String address2, String address3, Set grns) {
       this.supname = supname;
       this.comname = comname;
       this.contact1 = contact1;
       this.contact2 = contact2;
       this.email = email;
       this.address1 = address1;
       this.address2 = address2;
       this.address3 = address3;
       this.grns = grns;
    }
   
    public Integer getIdsupplier() {
        return this.idsupplier;
    }
    
    public void setIdsupplier(Integer idsupplier) {
        this.idsupplier = idsupplier;
    }
    public String getSupname() {
        return this.supname;
    }
    
    public void setSupname(String supname) {
        this.supname = supname;
    }
    public String getComname() {
        return this.comname;
    }
    
    public void setComname(String comname) {
        this.comname = comname;
    }
    public Integer getContact1() {
        return this.contact1;
    }
    
    public void setContact1(Integer contact1) {
        this.contact1 = contact1;
    }
    public Integer getContact2() {
        return this.contact2;
    }
    
    public void setContact2(Integer contact2) {
        this.contact2 = contact2;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddress1() {
        return this.address1;
    }
    
    public void setAddress1(String address1) {
        this.address1 = address1;
    }
    public String getAddress2() {
        return this.address2;
    }
    
    public void setAddress2(String address2) {
        this.address2 = address2;
    }
    public String getAddress3() {
        return this.address3;
    }
    
    public void setAddress3(String address3) {
        this.address3 = address3;
    }
    public Set getGrns() {
        return this.grns;
    }
    
    public void setGrns(Set grns) {
        this.grns = grns;
    }




}


