package com.danyayun.jpetstore.persistence;

import com.danyayun.jpetstore.domain.Cart;
import com.danyayun.jpetstore.domain.CartItem;
import com.danyayun.jpetstore.domain.Item;

import java.sql.ResultSet;
import java.util.List;

public interface CartDao {

    //void insertCartItem(CartItem cartItem, String userid);
    void insertCartItem(CartItem cartItem, String userid);

    List<CartItem> getCartItemListByUserid(String userid);

    void incrementQuantity(CartItem cartItem);

    void decrementQuantity(CartItem cartItem);

    void removeItemById(CartItem cartItem);

    void updateQuantityByItemId(CartItem cartItem, int quantity);

    void removeAllCartItemsByUserid(String userid);

    Item getItem(String itemId);


}


/*
    Cart getCartListByUser(String userid, List<CartItem> cartItemList1);
    void insertCartItem(List<CartItem> cartItemList, String userid);
    void updateCart(String userid, String itemid);
    void updateCart(String userid, String itemid, int quantity);
    void clearCart(String userid);

    //下面两个存在访问权限的冲突
    //CartItem resultSetToCartItem(ResultSet resultSet);
    //Item getItem(String itemId);
 */
