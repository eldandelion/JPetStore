package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.service.CatalogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ItemServlet", value = "/item")
public class ItemServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    private final CatalogService catalogService = new CatalogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the JSP

        String itemId = request.getParameter("itemId");


        String redirectUrl = "views/item_details.jsp";


        Item item = catalogService.getItem(itemId);


        if (item != null) {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("item", item);
            try {
                RequestDispatcher dispatcher = request.getRequestDispatcher(redirectUrl);
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = request.getParameter("itemId");
        String operation = request.getParameter("operation");

        //TODO utilize cartItem for quantity
        if (itemId != null && operation != null) {

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
