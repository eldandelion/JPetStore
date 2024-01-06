package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.domain.CartItem;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.service.CartService;
import com.danyayun.jpetstore.service.CatalogService;
import com.danyayun.jpetstore.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.image.CropImageFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    private final CartService cartService = new CartService();
    private final CatalogService catalogService = new CatalogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int cartSize = cartService.getNumberOfItems();

        String purpose = request.getParameter("purpose");
        if (purpose != null && purpose.equals("GET_SIZE")) {
            flush(Integer.toString(cartSize), response);
            return;
        }


        HttpSession session = request.getSession();
        // List<CartItem> cartItems = cartService.getCartItemList();
        List<CartItem> cartItems = cartService.getCartItemList();
//        CartItem example = new CartItem();
//        Item itemExample = new Item();
//        Product productExample = new Product();
//        productExample.setName("CaiYaYun");
//        itemExample.setProduct(productExample);
//        example.setItem(itemExample);

        // cartItems.add(example);
        session.setAttribute("cartItems", cartItems);


        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/cart.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

        /*HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");

        if(account != null){
            HttpServletRequest httpRequest= request;
            String strBackUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
                    + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

            LogService logService = new LogService();
            String logInfo = logService.logInfo(" ") + strBackUrl + " 查看购物车 " + cart;
            logService.insertLogInfo(account.getUsername(), logInfo);
        }*/
    }

    //TODO 当用户登录时，编写代码将物品保存到购物车
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ajax
        //purpose = why doPost was called
        String purpose = request.getParameter("purpose");
        if (purpose.isEmpty()) return;

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginAccount");

        if (purpose.equals("PURCHASE")) {
            String itemId = request.getParameter("itemId");
            //the user has not logged in yet
            if (account == null) {

                if (!cartService.containsItemId(itemId)) {
                    CartItem cartItem = new CartItem();
                    Item item = catalogService.getItem(itemId);
                    cartItem.setItem(item);

                    cartService.addItem1(cartItem);
                }

                cartService.incrementQuantityByItemId(itemId);

            } else {
                //TODO 账户不为空，将物品保存到数据库或者如果已存在于数据库中则更新数量

            }

            int cartSize = cartService.getNumberOfItems();
            flush(Integer.toString(cartSize), response);


        }


    }


    private void flush(String msg, HttpServletResponse response) {
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        try {
            response.getWriter().write(msg);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
