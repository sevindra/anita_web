/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.OnlineUsers;
import POJOS.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
public class online_u implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if (event.getName().equals("user_obj")) {

            try {
                User u = (User) event.getValue();
                OnlineUsers ou = new OnlineUsers();
                ou.setUser(u);
                objsave.save(ou);
                System.out.println(event.getName() + " Added " + u.getFname());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
       //ArrayList<model.session_cart> cart =null;
        User u = (User) event.getValue();
        System.out.println(event.getName() + " Remove " +event.getValue());
        //if (event.getName().equals("user_obj")) {

            try {
//                Map m = new HashMap();
//                Login l = (Login) m.get("login_obj");
//                Date d = (Date) m.get("date_time");
//                
//                Session s = objsave.getses();
//                Criteria c = s.createCriteria(LoginReg.class);
//                c.add(Restrictions.eq("login", l));
//                c.add(Restrictions.eq("indateTime", d));
//
//                LoginReg lrd = (LoginReg) c.uniqueResult();
//                lrd.setOutdateTime(new Date());
//                System.out.println(lrd.getIdloginReg());
//                objsave.update(lrd);
//                
                List<OnlineUsers> ou =objsave.getses().createCriteria(OnlineUsers.class).add(Restrictions.eq("user", u)).list();
                for (OnlineUsers ou1 : ou) {
                objsave.delete(ou1);
                    
                }


                //System.out.println("loginreg id "+lrd.getIdloginReg());
           //     System.out.println(event.getName() + " Remove " + u.getFname());
            } catch (Exception e) {
                e.printStackTrace();
            }
        //}
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {

    }

}
