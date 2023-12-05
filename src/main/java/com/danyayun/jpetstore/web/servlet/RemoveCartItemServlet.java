package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Cart;
import com.danyayun.jpetstore.domain.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RemoveCartItemServlet", value = "/removeCartItem")
public class RemoveCartItemServlet extends HttpServlet {

    private static final String ERROR_FORM = "view/error.jsp";
    private static final String CART_FORM = "view/cart.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        String workingItemId = req.getParameter("workingItemId");

        Item item = cart.removeItemById(workingItemId);

        if (item == null) {
            session.setAttribute("errorMsg", "Attempted to remove null CartItem from Cart.");
            req.getRequestDispatcher(ERROR_FORM).forward(req, resp);
        } else {
            req.getRequestDispatcher(CART_FORM).forward(req, resp);
        }
    }
}
