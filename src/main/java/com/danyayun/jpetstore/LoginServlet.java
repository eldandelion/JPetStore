package com.danyayun.jpetstore;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.service.AccountService;
import com.danyayun.jpetstore.service.CatalogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import static sun.security.util.KeyUtil.validate;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

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
        this.username = request.getParameter("username");
        this.password = request.getParameter("password");

        //校验用户输入的正确性
        if(!validate()){
            request.setAttribute("signOnMsg", this.msg);
            request.getRequestDispatcher(SIGN_ON_FORM).forward(request,response);
        }else{
            AccountService accountService = new AccountService();
            Account loginAccount = accountService.getAccount(username, password);
            if(loginAccount == null){
                this.msg = "用户名或密码错误";
                request.getRequestDispatcher(SIGN_ON_FORM).forward(request,response);
            }else {
                loginAccount.setPassword(null);
                HttpSession session = request.getSession();
                session.setAttribute("loginAccount" , loginAccount);

                if(loginAccount.isListOption()){
                    CatalogService catalogService = new CatalogService();
                    List<Product> myList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                    session.setAttribute("myList", myList);
                }

                response.sendRedirect("mainForm");
            }
        }
    }

    private boolean validate(){
        if(this.username == null || this.username.equals("")){
            this.msg = "用户名不能为空";
            return false;
        }
        if(this.password == null || this.password.equals("")){
            this.msg = "密码不能为空";
            return false;
        }
        return true;
    }
}
