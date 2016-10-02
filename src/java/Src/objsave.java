/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sevi
 */
public class objsave {

  public static Session ses;

    public static Session getses() throws Exception {

        if (ses == null) {

            ses = controler.connector.getSessionFactory().openSession();
        }
        return ses;
    }

    public static void save(Object obj) throws Exception {
        //ses = getses();
        getses();
        try {
            Transaction tr = ses.beginTransaction();
            ses.save(obj);
            tr.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(Object obj) throws Exception {
        //ses = getses();
        getses();
        try {
            Transaction tr = ses.beginTransaction();
            ses.update(obj);
            tr.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
