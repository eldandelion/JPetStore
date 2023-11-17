package com.danyayun.jpetstore;

import com.danyayun.jpetstore.domain.Category;
import com.danyayun.jpetstore.domain.Item;
import com.danyayun.jpetstore.domain.Product;
import com.danyayun.jpetstore.persistence.impl.CategoryDaoImpl;
import com.danyayun.jpetstore.service.CatalogService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        //CategoryDaoImpl categoryDao=new CategoryDaoImpl();
        CatalogService catalogService=new CatalogService();


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
                        System.out.println(p.getProductId());
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


        for (Item item:fishItems){
            System.out.println(item);
        }




        /*List<Category> categoryList =categoryDao.getCategoryList();
        //System.out.println(userList);
        for (Category category:categoryList){
            System.out.println(category);
        }*/

        //Category category =categoryDao.getCategory("BIRDS");
        //System.out.println(category);
    }
}
