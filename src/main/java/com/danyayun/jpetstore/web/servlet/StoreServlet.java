package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Category;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.service.CatalogService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

public class StoreServlet extends HttpServlet {

    private CatalogService catalogService;

    private static final Logger logger = Logger.getLogger(StoreServlet.class.getName());
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


        session.setAttribute("searchVisibility", true);
        session.setAttribute("categoryList", categoryList);
        session.setAttribute("productList", productList);
        session.setAttribute("itemList", itemList);
        session.setAttribute("myVariable", 1);

        try {
            request.getRequestDispatcher(PRODUCT_FORM).forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //Test
        Item item = new Item();
        Product product = new Product();
        product.setName("Bitch it works");
        item.setProduct(product);


        //TODO create an algorithm that searches for items according to search request

        // Get the search query
        String searchQuery = request.getParameter("searchQuery");

        List<Item> searchResults = new ArrayList<>();

        searchResults.add(item);

        request.setAttribute("searchItems", searchResults);

        // Forward the request to the JSP file for rendering

        RequestDispatcher dispatcher;


        if (searchQuery.isEmpty() || searchResults.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/views/search_results_not_found.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("/views/search_results.jsp");
        }

        dispatcher.forward(request, response);


    }

    public void destroy() {
    }
}