package com.danyayun.jpetstore.web.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;
import java.util.logging.Logger;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int cartSize = 4;

        String sizeRequest = request.getParameter("cartSizeQuery");

        if (sizeRequest != null) {
            logger.info(sizeRequest);
            flush(Integer.toString(cartSize), response);

            return;
        }


        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/cart.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
