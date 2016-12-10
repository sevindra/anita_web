/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import POJOS.Item;
import java.util.ArrayList;

/**
 *
 * @author Sevi
 */
public class Cart_sahan {
    static ArrayList<session_cart> cart;
    
    public static ArrayList<session_cart> getcart(){
        if (cart==null) {
            cart=new ArrayList<session_cart>();
        }
    return cart;
    }
}
