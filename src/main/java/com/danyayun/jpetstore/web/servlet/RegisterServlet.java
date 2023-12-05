package com.danyayun.jpetstore.web.servlet;

//import nl.captcha.Captcha;

import nl.captcha.Captcha;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
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

        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
        String answer = request.getParameter("answer");
        if (captcha.isCorrect(answer)) {
            //TODO 验证码逻辑



        }
    }
}
