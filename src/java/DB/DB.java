/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Sevi
 */
public class DB {
    static Connection c;
    static Statement s;
    static ResultSet rs;
    static String dbname;

    

    public static Connection getcon() throws Exception {
        
        if (c == null) {
            
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://192.168.1.10:3308/anitaweb", "root", "123");
        }
        return c;
    }

    public static void Updater(String query) throws Exception {

        if (c == null) {
            getcon();
        }

        if (s == null) {
            s = c.createStatement();
        }
        s.executeUpdate(query);
    }

    public static ResultSet Search(String query) throws SQLException, Exception {

        getcon();

        if (s == null) {
            s = c.createStatement();
        }

        rs = s.executeQuery(query);
        return rs;
    }

    public static String getDate() {

        Date d = new Date();
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String date = sd.format(d);

        return date;

    }
    public static String gettime() {

        Date d = new Date();
        SimpleDateFormat sd = new SimpleDateFormat("hh.mm.ss.a");
        String time = sd.format(d);

        return time;

    }
}
