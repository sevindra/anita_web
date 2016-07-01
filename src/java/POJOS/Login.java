package POJOS;
// Generated Jun 21, 2016 7:38:20 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private Integer idLogin;
     private User user;
     private String uname;
     private String upass;
     private Set loginRegs = new HashSet(0);

    public Login() {
    }

	
    public Login(User user) {
        this.user = user;
    }
    public Login(User user, String uname, String upass, Set loginRegs) {
       this.user = user;
       this.uname = uname;
       this.upass = upass;
       this.loginRegs = loginRegs;
    }
   
    public Integer getIdLogin() {
        return this.idLogin;
    }
    
    public void setIdLogin(Integer idLogin) {
        this.idLogin = idLogin;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getUname() {
        return this.uname;
    }
    
    public void setUname(String uname) {
        this.uname = uname;
    }
    public String getUpass() {
        return this.upass;
    }
    
    public void setUpass(String upass) {
        this.upass = upass;
    }
    public Set getLoginRegs() {
        return this.loginRegs;
    }
    
    public void setLoginRegs(Set loginRegs) {
        this.loginRegs = loginRegs;
    }




}


