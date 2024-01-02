package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/profile.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logOut = request.getParameter("operation");
        Account account = (Account) session.getAttribute("loginAccount");

        if (logOut != null && logOut.equals("invalidate") && account != null) {
            session.setAttribute("loginAccount", null);
            String contextPath = request.getContextPath();
            String path = contextPath + "/login";
            String json = "{\"redirect\": \"" + path + "\"}";

            flush(json, response);
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
