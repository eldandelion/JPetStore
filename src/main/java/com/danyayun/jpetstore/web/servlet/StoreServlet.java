package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Category;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.service.CatalogService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "storeServlet", value = "/store")
public class StoreServlet extends HttpServlet {

    private CatalogService catalogService;

    private static final String PRODUCT_FORM = "/views/store.jsp";

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        catalogService = new CatalogService();


        List<Category> categoryList = catalogService.getCategoryList();

        List<Product> productList = new ArrayList<>();

        List<Item> itemList = new ArrayList<>();

        for (Category c : categoryList) {
            productList.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
        }

        for (Product p : productList) {
            itemList.addAll(catalogService.getItemListByProduct(p.getProductId()));
        }


        HttpSession session = request.getSession();

        session.setAttribute("categoryList" , categoryList);
        session.setAttribute("productList" , productList);
        session.setAttribute("itemList" , itemList);

        try {
            request.getRequestDispatcher(PRODUCT_FORM).forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }


    }

    public void destroy() {
    }
}