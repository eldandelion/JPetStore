package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.service.AccountService;
import com.danyayun.jpetstore.service.CatalogService;
import nl.captcha.Captcha;
//import nl.captcha.Captcha;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;


@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    private static final String SIGN_ON_FORM = "views/login.jsp";

    private String username;
    private String password;

    private String msg;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");


        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher(SIGN_ON_FORM);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
        String answer = request.getParameter("answer");
        if (!captcha.isCorrect(answer)) {
            msg = "WRONG_CAPTCHA";
            String json = "{\"message\": \"" + msg + "\"}";
            flush(json, response);
            request.setAttribute("signOnMsg", msg);
            return;

        }
        this.username = request.getParameter("username");
        this.password = request.getParameter("password");



        //校验用户输入的正确性
        AccountService accountService = new AccountService();
        Account loginAccount = accountService.getAccount(username, password);
        if (loginAccount == null) {
            msg = "WRONG_CREDENTIALS";
            String json = "{\"message\": \"" + msg + "\"}";
            flush(json, response);
            //request.getRequestDispatcher(SIGN_ON_FORM).forward(request, response);
        } else {
            loginAccount.setPassword(null);
            session.setAttribute("loginAccount", loginAccount);

            if (loginAccount.isListOption()) {
                CatalogService catalogService = new CatalogService();
                List<Product> myList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                session.setAttribute("myList", myList);
            }

            String contextPath = request.getContextPath();
            String path = contextPath + "/profile";
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


