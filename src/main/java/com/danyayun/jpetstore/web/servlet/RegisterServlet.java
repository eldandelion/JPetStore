package com.danyayun.jpetstore.web.servlet;

//import nl.captcha.Captcha;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.service.AccountService;
import nl.captcha.Captcha;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");


        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");


        String msg;

        if (username != null) {
            if (accountService.getAccountByUsername(username) != null) {
                msg = "USER_EXISTS";
            } else {
                msg = "ALLOWED";
            }
            String json = "{\"message\": \"" + msg + "\"}";
            flush(json, response);
            return;
        }


        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
        String answer = request.getParameter("answer");
        if (captcha.isCorrect(answer)) {
            //TODO 验证码逻辑


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
