package POJOS;
// Generated Dec 13, 2016 9:42:23 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * LoginReg generated by hbm2java
 */
public class LoginReg  implements java.io.Serializable {


     private Integer idloginReg;
     private Login login;
     private Date indate;
     private Date intime;
     private Date outdate;
     private Date outtime;

    public LoginReg() {
    }

	
    public LoginReg(Login login) {
        this.login = login;
    }
    public LoginReg(Login login, Date indate, Date intime, Date outdate, Date outtime) {
       this.login = login;
       this.indate = indate;
       this.intime = intime;
       this.outdate = outdate;
       this.outtime = outtime;
    }
   
    public Integer getIdloginReg() {
        return this.idloginReg;
    }
    
    public void setIdloginReg(Integer idloginReg) {
        this.idloginReg = idloginReg;
    }
    public Login getLogin() {
        return this.login;
    }
    
    public void setLogin(Login login) {
        this.login = login;
    }
    public Date getIndate() {
        return this.indate;
    }
    
    public void setIndate(Date indate) {
        this.indate = indate;
    }
    public Date getIntime() {
        return this.intime;
    }
    
    public void setIntime(Date intime) {
        this.intime = intime;
    }
    public Date getOutdate() {
        return this.outdate;
    }
    
    public void setOutdate(Date outdate) {
        this.outdate = outdate;
    }
    public Date getOuttime() {
        return this.outtime;
    }
    
    public void setOuttime(Date outtime) {
        this.outtime = outtime;
    }




}


