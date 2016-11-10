/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.PagesHasUtype;
import POJOS.User;
import org.hibernate.Session;

/**
 *
 * @author Sevi
 */
public class privilege_class {
    public boolean  getPrivilage(String ID,String url){
    
        try {
            
            Session s=objsave.getses();
             
            User u=(User) s.load(User.class, Integer.parseInt(ID));
            String pge [] =url.split("/");
         
            for (PagesHasUtype rhp : u.getUtype().getPagesHasUtypes()) {
                 System.out.println("awaaaaa  "+pge[pge.length-1]);
                if (rhp.getPages().getPageName().equals(pge[pge.length-1])) {
                    
                    return true;
                    
                }else{
                return false;
                }
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    return  false;
    }
}
