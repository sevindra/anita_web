package POJOS;
// Generated 01-Jul-2016 05:52:52 by Hibernate Tools 4.3.1



/**
 * WatchList generated by hbm2java
 */
public class WatchList  implements java.io.Serializable {


     private Integer idwatchList;
     private Item item;
     private User user;

    public WatchList() {
    }

    public WatchList(Item item, User user) {
       this.item = item;
       this.user = user;
    }
   
    public Integer getIdwatchList() {
        return this.idwatchList;
    }
    
    public void setIdwatchList(Integer idwatchList) {
        this.idwatchList = idwatchList;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }




}


