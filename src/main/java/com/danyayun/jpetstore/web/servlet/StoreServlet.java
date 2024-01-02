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
import java.util.logging.Logger;
import javax.servlet.annotation.*;

public class StoreServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());


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

        //List<Item> fishItems = new ArrayList<>();

        /*String fishCategoryId = "";
        String dogsCategoryId = "";
        String catsCategoryId = "";
        String reptilesCategoryId = "";
        String birdsCategoryId = "";*/

        List<Product> fishProducts = new ArrayList<>();
        List<Product> dogsProducts = new ArrayList<>();
        List<Product> catsProducts = new ArrayList<>();
        List<Product> reptilesProducts = new ArrayList<>();
        List<Product> birdsProducts = new ArrayList<>();

        List<Item> fishItems = new ArrayList<>();
        List<Item> dogsItems = new ArrayList<>();
        List<Item> catsItems = new ArrayList<>();
        List<Item> reptilesItems = new ArrayList<>();
        List<Item> birdsItems = new ArrayList<>();

        for (Category c : categoryList) {
            switch (c.getName()) {
                case "Fish":
                   // fishCategoryId = c.getCategoryId();
                    fishProducts.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
                    for (Product p : fishProducts) {
                        fishItems.addAll(catalogService.getItemListByProduct(p.getProductId()));
                    }
                    break;
                case "Dogs":
                   // dogsCategoryId = c.getCategoryId();
                    dogsProducts.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
                    for (Product p : dogsProducts) {
                        dogsItems.addAll(catalogService.getItemListByProduct(p.getProductId()));
                    }
                    break;
                case "Cats":
                    //catsCategoryId = c.getCategoryId();
                    catsProducts.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
                    for (Product p : catsProducts) {
                        catsItems.addAll(catalogService.getItemListByProduct(p.getProductId()));
                    }
                    break;
                case "Reptiles":
                    //reptilesCategoryId = c.getCategoryId();
                    reptilesProducts.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
                    for (Product p : reptilesProducts) {
                        reptilesItems.addAll(catalogService.getItemListByProduct(p.getProductId()));
                    }
                    break;
                case "Birds":
                   // birdsCategoryId = c.getCategoryId();
                    birdsProducts.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
                    for (Product p : birdsProducts) {
                        birdsItems.addAll(catalogService.getItemListByProduct(p.getProductId()));
                    }
                    break;
            }
        }

        HttpSession session = request.getSession();

        session.setAttribute("fishItems" , fishItems);
        session.setAttribute("dogsItems" , dogsItems);
        session.setAttribute("catsItems" , catsItems);
        session.setAttribute("reptilesItems" , reptilesItems);
        session.setAttribute("birdsItems" , birdsItems);


        for (Category c : categoryList) {
            productList.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
        }

        for (Product p : productList) {
            itemList.addAll(catalogService.getItemListByProduct(p.getProductId()));
        }



        session.setAttribute("categoryList" , categoryList);
        session.setAttribute("productList" , productList);
        session.setAttribute("itemList" , itemList);

        try {
            request.getRequestDispatcher(PRODUCT_FORM).forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }


    }

    private static final String INPUT_RESULTS_STRING = "/views/input_results.jsp";
    private static final String SEARCH_RESULTS_STRING = "/views/search_results.jsp";
    private static final String SEARCH_RESULTS_NOT_FOUND_STRING = "/views/search_results_not_found.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // Get the search query
        String searchQuery = request.getParameter("searchQuery");

        String input = request.getParameter("input");

        String CONTENT_URL = "";

        List<Item> searchResults = new ArrayList<>();


        if (searchQuery != null) {
            searchResults = findResults(searchQuery);
            CONTENT_URL = searchResults.isEmpty() ? SEARCH_RESULTS_NOT_FOUND_STRING : SEARCH_RESULTS_STRING;

        } else if (input != null) {
            searchResults = deleteDuplicates(findResults(input));

            if (searchResults.isEmpty()) return;
            CONTENT_URL = INPUT_RESULTS_STRING;
        }

        request.setAttribute("searchItems", searchResults);

        // Forward the request to the JSP file for rendering

        RequestDispatcher dispatcher = request.getRequestDispatcher(CONTENT_URL);
        dispatcher.forward(request, response);
    }

    private List<Item> deleteDuplicates(List<Item> original) {
        List<Item> temp = new ArrayList<>();
        for (Item i: original) {
            boolean contains = false;
            for (Item j: temp) {
                if (i.getProduct().getName().equals(j.getProduct().getName())){
                    contains = true;
                    break;
                }
            }
            if (!contains) {
                temp.add(i);
            }
        }
        return temp;
    }

    private List<Item> findResults(String searchQuery) {

        catalogService = new CatalogService();

        List<Product> productList = catalogService.searchProductList(searchQuery);

        List<Item> itemList = new ArrayList<>();

        for (Product p : productList) {
            itemList.addAll(catalogService.getItemListByProduct(p.getProductId()));
        }


        return itemList;
    }

    public void destroy() {
    }
}