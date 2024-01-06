package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {

    private final AccountService accountService = new AccountService();
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
        String operation = request.getParameter("operation");
        Account account = (Account) session.getAttribute("loginAccount");

        if (operation != null && operation.equals("update") && account != null) {
            String newPassword =  request.getParameter("newPassword");
            String newAddress =  request.getParameter("newAddress");
            String newAddressTwo =  request.getParameter("newAddressTwo");
            String newEmail =  request.getParameter("newEmailAddress");
            String newPhone = request.getParameter("newPhone");
            String newZip = request.getParameter("newZip");

            logger.info(newPassword + " " + newAddress + " "
                    + newAddressTwo + " " + newEmail
                    + " " + newPhone + " " + newZip);

            account.setPassword(newPassword);
            account.setPhone(newPhone);
            account.setAddress1(newAddress);
            account.setAddress2(newAddressTwo);
            account.setEmail(newEmail);
            account.setZip(newZip);

            accountService.updateAccount(account);


            session.setAttribute("loginAccount", account);

            String msg = "SAVED";

            String json = "{\"message\": \"" + msg + "\"}";
            flush(json, response);

        } else if (operation != null && operation.equals("invalidate") && account != null) {
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
