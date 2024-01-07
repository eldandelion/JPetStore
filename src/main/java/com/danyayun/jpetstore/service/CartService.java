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
        cartDao = new CartDaoImpl();
    }

    private final Map<String, CartItem> itemMap = Collections.synchronizedMap(new HashMap<String, CartItem>());
    private  List<CartItem> itemList = new ArrayList<CartItem>();

    public Iterator<CartItem> getCartItems() {
        return itemList.iterator();
    }

    public List<CartItem> getCartItemList() {
        return itemList;
    }

    public int getNumberOfItems() {
        return itemList.size();
    }

    public Iterator<CartItem> getAllCartItems() {
        return itemList.iterator();
    }

    public boolean containsItemId(String itemId) {
        return itemMap.containsKey(itemId);
    }

/*    public void addItem(Item item, boolean isInStock, String userid) {
        CartItem cartItem = (CartItem) itemMap.get(item.getItemId());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setItem(item);
            cartItem.setQuantity(0);
            cartItem.setInStock(isInStock);
            itemMap.put(item.getItemId(), cartItem);
            itemList.add(cartItem);
            if(userid != null && !userid.equals("")){
                //数据库中插入
                cartDao.insertCartItem(cartItem, userid);
            }
        }
        cartItem.incrementQuantity();
        cartDao.incrementQuantity(cartItem);
    }*/

    public void addItem(Item item, boolean isInStock, String userid) {
        CartItem cartItem = (CartItem) itemMap.get(item.getItemId());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setItem(item);
            cartItem.setQuantity(0);
            cartItem.setInStock(isInStock);
            itemMap.put(item.getItemId(), cartItem);
            itemList.add(cartItem);
            if(userid != null && !userid.equals("")){
                //数据库中插入
                cartDao.insertCartItem(cartItem, userid);
            }
        }
        cartItem.incrementQuantity();
        cartDao.incrementQuantity(cartItem);
    }

    public Item removeItemById(String itemId) {
        CartItem cartItem = (CartItem) itemMap.remove(itemId);
        if (cartItem == null) {
            return null;
        } else {
            itemList.remove(cartItem);
            cartDao.removeItemById(cartItem);
            return cartItem.getItem();
        }
    }

    public void incrementQuantityByItemId(String itemId) {
        CartItem cartItem = (CartItem) itemMap.get(itemId);
        cartItem.incrementQuantity();
        cartDao.incrementQuantity(cartItem);
    }

    public void decrementQuantityByItemId(String itemId) {
        CartItem cartItem = (CartItem) itemMap.get(itemId);
        cartItem.decrementQuantity();
        cartDao.decrementQuantity(cartItem);
    }

    public void setQuantityByItemId(String itemId, int quantity) {
        CartItem cartItem = (CartItem) itemMap.get(itemId);
        cartItem.setQuantity(quantity);
//    cartDao.incrementQuantity(cartItem);
        cartDao.updateQuantityByItemId(cartItem, quantity);
    }

    public BigDecimal getSubTotal() {
        BigDecimal subTotal = new BigDecimal("0");
        Iterator<CartItem> items = getAllCartItems();
        while (items.hasNext()) {
            CartItem cartItem = (CartItem) items.next();
            Item item = cartItem.getItem();
            BigDecimal listPrice = item.getListPrice();
            BigDecimal quantity = new BigDecimal(String.valueOf(cartItem.getQuantity()));
            subTotal = subTotal.add(listPrice.multiply(quantity));
        }
        return subTotal;
    }

    public void clear() {
        itemList.clear();
        itemMap.clear();
    }

    public List<CartItem> getCartItemListByUserid(String userid){
        return cartDao.getCartItemListByUserid(userid);
    }

    public void addItem1(CartItem cartItem){
        itemMap.put(cartItem.getItem().getItemId(), cartItem);
        itemList.add(cartItem);
    }

    public void removeAllCartItemsByUserid(String userid){
        cartDao.removeAllCartItemsByUserid(userid);
    }

    public void addItemQuantity(Item item, boolean isInStock,int quantity) {
        CartItem cartItem = (CartItem) itemMap.get(item.getItemId());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setItem(item);
            cartItem.setQuantity(quantity);
            cartItem.setInStock(isInStock);
            itemMap.put(item.getItemId(), cartItem);
            itemList.add(cartItem);
        }
        else {
            //cartItem.incrementQuantity();
            cartItem.setQuantity(quantity);
        }
    }


}


