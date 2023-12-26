package com.danyayun.jpetstore.service;

import com.danyayun.jpetstore.domain.Cart;
import com.danyayun.jpetstore.domain.CartItem;
import com.danyayun.jpetstore.domain.Category;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.persistence.CartDao;
import com.danyayun.jpetstore.persistence.CategoryDao;
import com.danyayun.jpetstore.persistence.ItemDao;
import com.danyayun.jpetstore.persistence.ProductDao;
import com.danyayun.jpetstore.persistence.impl.CartDaoImpl;
import com.danyayun.jpetstore.persistence.impl.CategoryDaoImpl;
import com.danyayun.jpetstore.persistence.impl.ItemDaoImpl;
import com.danyayun.jpetstore.persistence.impl.ProductDaoImpl;

import java.math.BigDecimal;
import java.util.*;

public class CartService {
    private CartDao cartDao;

    public CartService(){
        this.cartDao=new CartDaoImpl();
    }

    public Cart getCartListByUser(String userid, List<CartItem> cartItemList1){
        return cartDao.getCartListByUser(userid,cartItemList1);
    };

    /*public void insertCartItem(List<CartItem> cartItemList, String userid){};
    public void updateCart(String userid, String itemid){};
    public void updateCart(String userid, String itemid, int quantity){};
    public void clearCart(String userid){};*/




    void insertCartItem(List<CartItem> cartItemList, String userid) {

    }

    void updateCart(String userid, String itemid) {
    }

    void updateCart(String userid, String itemid, int quantity) {

    }

    void clearCart(String userid) {

    }


}
