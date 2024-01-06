package com.danyayun.jpetstore.persistence.impl;

import com.danyayun.jpetstore.domain.Cart;
import com.danyayun.jpetstore.domain.CartItem;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.persistence.CartDao;
import com.danyayun.jpetstore.persistence.DBUtil;
import com.danyayun.jpetstore.persistence.ItemDao;
import com.danyayun.jpetstore.service.CatalogService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    ItemDao itemDao = new ItemDaoImpl();

    private static final String insertCartItemString = "INSERT INTO cart (userid, cartItemItemItemId, cartItemItemProductProductId, \n" +
            "cartItemItemAttribute1, cartItemItemAttribute2, cartItemItemAttribute3,\n" +
            "cartItemItemAttribute4, cartItemItemAttribute5, cartItemItemProductName,\n" +
            "cartItemInStock, cartItemQuantity, cartItemItemListPrice, cartItemTotal)\n" +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String getCartItemListByUserid = "SELECT cartItemItemItemId, cartItemQuantity FROM cart WHERE userid = ?";

    private static final String incrementQuantityString = "UPDATE cart SET cartItemQuantity = ? WHERE cartItemItemItemId = ?";

    private static final String removeItemByIdString = "DELETE FROM cart WHERE cartItemItemItemId = ?";

    private static final String updateQuantityByItemIdString = "UPDATE cart SET cartItemQuantity = ? WHERE cartItemItemItemId = ?";

    private static final String removeAllCartItemsByUseridString = "DELETE FROM cart WHERE userid = ?";

    @Override
    public void insertCartItem(CartItem cartItem, String userid) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(insertCartItemString);
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, cartItem.getItem().getItemId());
            preparedStatement.setString(3, cartItem.getItem().getProduct().getProductId());
            preparedStatement.setString(4, cartItem.getItem().getAttribute1());
            preparedStatement.setString(5, cartItem.getItem().getAttribute2());
            preparedStatement.setString(6, cartItem.getItem().getAttribute3());
            preparedStatement.setString(7, cartItem.getItem().getAttribute4());
            preparedStatement.setString(8, cartItem.getItem().getAttribute5());
            preparedStatement.setString(9, cartItem.getItem().getProduct().getName());
            if (cartItem.isInStock()){
                preparedStatement.setInt(10, 1);
            } else {
                preparedStatement.setInt(10, 0);
            }
            preparedStatement.setInt(11, cartItem.getQuantity());
            preparedStatement.setBigDecimal(12, cartItem.getItem().getListPrice());
            preparedStatement.setBigDecimal(13, cartItem.getTotal());

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CartItem> getCartItemListByUserid(String userid) {
        List<CartItem> cartItemList = new ArrayList<CartItem>();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(getCartItemListByUserid);
            preparedStatement.setString(1, userid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                CartItem cartItem = new CartItem();

                //获取item
                String itemId = resultSet.getString(1);
                Item item =itemDao.getItem(itemId);
                cartItem.setItem(item);

                //获取quantity
                int quantity = resultSet.getInt(2);
                cartItem.setQuantity(quantity);

                //获取total
                cartItem.calculateTotal();

                //获取inStock
                cartItem.setInStock(itemDao.getInventoryQuantity(itemId) > 0);

                cartItemList.add(cartItem);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cartItemList;
    }

    @Override
    public void incrementQuantity(CartItem cartItem) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(incrementQuantityString);

            pStatement.setInt(1, cartItem.getQuantity());
            pStatement.setString(2, cartItem.getItem().getItemId());

            int res = pStatement.executeUpdate();
            if (res == 1) {
                System.out.println("incrementQuantity成功");
            } else {
                System.out.println("incrementQuantity失败");
            }

            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeItemById(CartItem cartItem) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(removeItemByIdString);

            preparedStatement.setString(1, cartItem.getItem().getItemId());

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateQuantityByItemId(CartItem cartItem, int quantity) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(updateQuantityByItemIdString);

            pStatement.setInt(1, quantity);
            pStatement.setString(2, cartItem.getItem().getItemId());

            int res = pStatement.executeUpdate();
            if (res == 1) {
                System.out.println("updateQuantityByItemId成功");
            } else {
                System.out.println("updateQuantityByItemId失败");
            }

            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeAllCartItemsByUserid(String userid) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(removeAllCartItemsByUseridString);

            preparedStatement.setString(1, userid);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}

/*
 private static final String GET_CART_BY_USER =
            "SELECT ITEMID, QUANTITY FROM CART WHERE USERID = ?";

    private static final String GET_ITEM_ISAPPEAR =
            "SELECT ITEMID FROM CART WHERE USERID = ? AND ITEMID = ?";

    private static final String GET_ITEM_QUANTITY=
            "SELECT QUANTITY FROM CART WHERE USERID = ? AND ITEMID = ?";

    private static final String UPDATE_CART =
            "UPDATE CART SET QUANTITY = ? WHERE ITEMID = ? AND USERID = ? ";

    private static final String CLEAR_CART =
            "UPDATE CART SET QUANTITY = 0 WHERE USERID = ?";

    private static final String INSERT_CART =
            "INSERT INTO CART (ITEMID, QUANTITY,USERID) " +
                    "VALUES (?, ?, ?)";

    private static final String getItemString =
            "SELECT I.ITEMID,LISTPRICE,UNITCOST,SUPPLIER AS supplierId," +
                    "I.PRODUCTID AS productId,NAME AS productName," +
                    "DESCN AS productDescription,CATEGORY AS CategoryId,STATUS," +
                    "ATTR1 AS attribute1,ATTR2 AS attribute2,ATTR3 AS attribute3," +
                    "ATTR4 AS attribute4,ATTR5 AS attribute5,QTY AS quantity " +
                    "from ITEM I, INVENTORY V, PRODUCT P where P.PRODUCTID = I.PRODUCTID and I.ITEMID = V.ITEMID and I.ITEMID=?";


    public Cart getCartListByUser(String userid, List<CartItem> cartItemList1){
        Cart cartResult = new Cart();
        CartItem cartItem ;
        List<CartItem> cartItemList = new ArrayList<>();
        List<CartItem> itemList = new ArrayList<>();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        try {
            Connection connection = DBUtil.getConnection();
            if(cartItemList1 != null){
                int num = cartItemList1.size();
                for(int i = 0; i < num; i++){
                    preparedStatement = connection.prepareStatement(GET_ITEM_ISAPPEAR);
                    preparedStatement.setString(1,userid);
                    preparedStatement.setString(2,cartItemList1.get(i).getItem().getItemId());
                    resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){
                        updateCart(userid, cartItemList.get(i).getItem().getItemId());
                        System.out.println("加入购物车成功");
                    }
                    else{
                        preparedStatement = connection.prepareStatement(INSERT_CART);
                        preparedStatement.setString(1,cartItemList1.get(i).getItem().getItemId());
                        preparedStatement.setInt(2,cartItemList1.get(i).getQuantity());
                        preparedStatement.setString(3,userid);
                        int rowsAffected = preparedStatement.executeUpdate();
                        if(rowsAffected > 0){
                            System.out.println("加入购物车成功");
                        }
                    }
                }
            }
            preparedStatement = connection.prepareStatement(GET_CART_BY_USER);
            preparedStatement.setString(1,userid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                cartItem = new CartItem();
                cartItem = resultSetToCartItem(resultSet);
                cartItemList.add(cartItem);
            }
            if(!cartItemList.isEmpty()){
                for(int i = 0; i < cartItemList.size();i++){
                    if(cartItemList.get(i).getQuantity() > 0 ){
                        itemList.add(cartItemList.get(i));
                    }
                }
                cartResult.setItemList(itemList);
            }

            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cartResult;
    }

    public void insertCartItem(List<CartItem> cartItemList, String userid){
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            int num = cartItemList.size();
            for(int i = 0; i < num; i++){
                preparedStatement = connection.prepareStatement(GET_ITEM_ISAPPEAR);
                preparedStatement.setString(1,userid);
                preparedStatement.setString(2,cartItemList.get(i).getItem().getItemId());
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    updateCart(userid, cartItemList.get(i).getItem().getItemId(), cartItemList.get(i).getQuantity());
                    System.out.println("加入购物车成功");
                }
                else{
                    preparedStatement = connection.prepareStatement(INSERT_CART);
                    preparedStatement.setString(1,cartItemList.get(i).getItem().getItemId());
                    preparedStatement.setInt(2,cartItemList.get(i).getQuantity());
                    preparedStatement.setString(3,userid);
                    int rowsAffected = preparedStatement.executeUpdate();
                    if(rowsAffected > 0){
                        System.out.println("加入购物车成功");
                    }
                }

            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateCart(String userid, String itemid){
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ITEM_QUANTITY);
            preparedStatement.setString(1,userid);
            preparedStatement.setString(2,itemid);
            ResultSet resultSet = preparedStatement.executeQuery();
            int quantity = 0;
            if(resultSet.next()){
                quantity = resultSet.getInt("quantity");
            }
            preparedStatement = connection.prepareStatement(UPDATE_CART);
            preparedStatement.setInt(1,quantity+1);
            preparedStatement.setString(2,itemid);
            preparedStatement.setString(3,userid);
            int rowsAffected = preparedStatement.executeUpdate();
            if(rowsAffected > 0){
                System.out.println("购物车更新成功");
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void updateCart(String userid, String itemid, int quantity){
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART);
            preparedStatement.setInt(1,quantity);
            preparedStatement.setString(2,itemid);
            preparedStatement.setString(3,userid);
            int rowsAffected = preparedStatement.executeUpdate();
            if(rowsAffected > 0){
                System.out.println("购物车更新成功");
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void clearCart(String userid){
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CLEAR_CART);
            preparedStatement.setString(1, userid);
            int rowsAffected = preparedStatement.executeUpdate();
            if(rowsAffected > 0){
                System.out.println("购物车清空成功");
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private CartItem resultSetToCartItem(ResultSet resultSet) throws Exception{
        CartItem cartItem = new CartItem();
        Item item = getItem(resultSet.getString("itemid"));
        cartItem.setItem(item);
        cartItem.setQuantity(resultSet.getInt("quantity"));
        CatalogService catalogService = new CatalogService();
        boolean isInStock = catalogService.isItemInStock(resultSet.getString("itemid"));
        cartItem.setInStock(isInStock);
        return cartItem;
    }

    private Item getItem(String itemId) {
        Item item = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(getItemString);
            pStatement.setString(1, itemId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                item = new Item();
                item.setItemId(resultSet.getString(1));
                item.setListPrice(resultSet.getBigDecimal(2));
                item.setUnitCost(resultSet.getBigDecimal(3));
                item.setSupplierId(resultSet.getInt(4));
                Product product = new Product();
                product.setProductId(resultSet.getString(5));
                product.setName(resultSet.getString(6));
                product.setDescription(resultSet.getString(7));
                product.setCategoryId(resultSet.getString(8));
                item.setProduct(product);
                item.setStatus(resultSet.getString(9));
                item.setAttribute1(resultSet.getString(10));
                item.setAttribute2(resultSet.getString(11));
                item.setAttribute3(resultSet.getString(12));
                item.setAttribute4(resultSet.getString(13));
                item.setAttribute5(resultSet.getString(14));
                item.setQuantity(resultSet.getInt(15));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return item;
    }
 */
