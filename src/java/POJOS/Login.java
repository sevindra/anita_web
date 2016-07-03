package POJOS;
// Generated 02-Jul-2016 15:04:48 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private Integer idLogin;
     private User user;
     private String email;
     private String upass;
     private Set loginRegs = new HashSet(0);

    public Login() {
    }

	
    public Login(User user) {
        this.user = user;
    }
    public Login(User user, String email, String upass, Set loginRegs) {
       this.user = user;
       this.email = email;
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
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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


