package POJOS;
// Generated Oct 16, 2016 2:02:03 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Utype generated by hbm2java
 */
public class Utype  implements java.io.Serializable {


     private Integer idutype;
     private String utype;
     private Set<User> users = new HashSet<User>(0);

    public Utype() {
    }

    public Utype(String utype, Set<User> users) {
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
    public Set<User> getUsers() {
        return this.users;
    }
    
    public void setUsers(Set<User> users) {
        this.users = users;
    }




}


