/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Pages;
import POJOS.PagesHasUtype;
import POJOS.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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
                 System.out.println("awaaaaa  "+pge[pge.length-1]);
                 Pages p =(Pages) objsave.getses().createCriteria(Pages.class).add(Restrictions.eq("pageName", pge[pge.length-1].toString())).uniqueResult();
            List<PagesHasUtype> l=objsave.getses().createCriteria(PagesHasUtype.class).add(Restrictions.and(Restrictions.eq("utype", u.getUtype()),Restrictions.eq("pages", p))).list();
            for (PagesHasUtype rhp : l) {
                 System.out.println(rhp.getPages().getPageName()+" =  "+pge[pge.length-1]);
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
