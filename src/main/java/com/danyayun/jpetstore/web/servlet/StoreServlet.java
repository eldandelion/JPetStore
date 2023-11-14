package com.danyayun.jpetstore.web.servlet;

import com.danyayun.jpetstore.domain.Category;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.persistence.impl.CategoryDaoImpl;
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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
 /*      String categoryId = request.getParameter("categoryId");
         catalogService = new CatalogService();
         Category category = catalogService.getCategory(categoryId);
         //查列表
         List<Product> productList = catalogService.getProductListByCategory(categoryId);
         HttpSession session = request.getSession();
         session.setAttribute("category",category);
         session.setAttribute("producList",productList);


        String productId = request.getParameter("productId");
        //catalogService = new CatalogService();
        Product product = catalogService.getProduct(productId);
        List<Item> itemList = catalogService.getItemListByProduct(productId);
        //HttpSession session = request.getSession();
        session.setAttribute("product" , product);
        session.setAttribute("itemList" , itemList);


        String itemId = request.getParameter("itemId");
        //catalogService = new CatalogService();
        Item item = catalogService.getItem(itemId);
        //这里的product1是由item为导向查找对应的
        Product product1 = item.getProduct();
        //HttpSession session = request.getSession();
        session.setAttribute("product1", product1);
        session.setAttribute("item", item);

 */

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


        /*for (Category c : categoryList) {
            productList.addAll(catalogService.getProductListByCategory(c.getCategoryId()));
        }

        for (Product p : productList) {
            itemList.addAll(catalogService.getItemListByProduct(p.getProductId()));
        }*/



        session.setAttribute("categoryList" , categoryList);
        session.setAttribute("productList" , productList);
        session.setAttribute("itemList" , itemList);
        session.setAttribute("myVariable", 1);

        try {
            request.getRequestDispatcher(PRODUCT_FORM).forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }


    }

    public void destroy() {
    }



}

