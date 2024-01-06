package com.danyayun.jpetstore.web.servlet;

//import nl.captcha.Captcha;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.service.AccountService;
import nl.captcha.Captcha;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    private AccountService accountService = new AccountService();

    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

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

        String purpose = request.getParameter("purpose");
        String msg;

        switch (purpose) {
            case "SAVE":
                String name = request.getParameter("firstName");
                String lastname = request.getParameter("lastName");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String emailAddress = request.getParameter("emailAddress");
                String shippingAddress = request.getParameter("shippingAddress");
                String shippingAddressTwo = request.getParameter("shippingAddressTwo");
                String country = request.getParameter("country");
                String zip = request.getParameter("zip");
                String languagePreference = request.getParameter("languagePreference");
                String favoriteCategory = request.getParameter("favoriteCategory");
                String myBanner = request.getParameter("myBanner");
                String myList = request.getParameter("myList");

                saveIntoDatabase(
                        name,
                        lastname,
                        username,
                        password,
                        emailAddress,
                        shippingAddress,
                        shippingAddressTwo,
                        country,
                        zip,
                        languagePreference,
                        favoriteCategory,
                        myBanner,
                        myList
                );
                Account newAccount = accountService.getAccount(username, password);
                session.setAttribute("loginAccount", newAccount);


                String contextPath = request.getContextPath();
                String path = contextPath + "/profile";
                String json = "{\"redirect\": \"" + path + "\"}";
                flush(json, response);
                return;
            case "CHECK":

        }

        String username = request.getParameter("username");


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

    private void saveIntoDatabase(String name,
                                  String lastName,
                                  String username,
                                  String password,
                                  String email,
                                  String shipping1,
                                  String shipping2,
                                  String country,
                                  String zip,
                                  String language,
                                  String favouriteCategory,
                                  String myBanner,
                                  String myList) {

        Account account = new Account();
        account.setFirstName(name);
        account.setLastName(lastName);
        account.setUsername(username);
        account.setPassword(password);
        account.setEmail(email);
        account.setAddress1(shipping1);
        account.setAddress2(shipping2);
        account.setCountry(country);
        account.setZip(zip);
        account.setCity("");
        account.setState("");
        account.setPhone("");
        account.setLanguagePreference(language);
        account.setFavouriteCategoryId(favouriteCategory);
        account.setBannerName(myBanner); //idk how to use it so we will leave it like that for now
        account.setListOption(parseOption(myList));

        accountService.insertAccount(account);



    }

    private boolean parseOption(String s) {
        if (s == null || s.isEmpty()) {
            return false;
        } else return s.equals("on");
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
