package POJOS;
// Generated May 7, 2016 1:07:55 PM by Hibernate Tools 4.3.1



/**
 * LoginReg generated by hbm2java
 */
public class LoginReg  implements java.io.Serializable {


     private Integer idloginReg;
     private Login login;
     private String intime;
     private String outtime;
     private String date;

    public LoginReg() {
    }

	
    public LoginReg(Login login) {
        this.login = login;
    }
    public LoginReg(Login login, String intime, String outtime, String date) {
       this.login = login;
       this.intime = intime;
       this.outtime = outtime;
       this.date = date;
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
    public String getIntime() {
        return this.intime;
    }
    
    public void setIntime(String intime) {
        this.intime = intime;
    }
    public String getOuttime() {
        return this.outtime;
    }
    
    public void setOuttime(String outtime) {
        this.outtime = outtime;
    }
    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }




}


