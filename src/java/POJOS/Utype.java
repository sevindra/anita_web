package POJOS;
// Generated Sep 25, 2016 9:30:20 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Utype generated by hbm2java
 */
public class Utype  implements java.io.Serializable {


     private Integer idutype;
     private String utype;
     private Set users = new HashSet(0);

    public Utype() {
    }

    public Utype(String utype, Set users) {
       this.utype = utype;
       this.users = users;
    }
   
    public Integer getIdutype() {
        return this.idutype;
    }
    
    public void setIdutype(Integer idutype) {
        this.idutype = idutype;
    }
    public String getUtype() {
        return this.utype;
    }
    
    public void setUtype(String utype) {
        this.utype = utype;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


