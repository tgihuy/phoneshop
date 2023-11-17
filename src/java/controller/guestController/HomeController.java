/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.guestController;

import DAO.BlogDAO;
import DAO.CartDBContext;
import DAO.CategoryDBContext;
import DAO.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import models.Account;
import models.Blog;
import models.CartDetail;
import models.Category;
import models.Product;

/**
 *
 * @author admin
 */
public class HomeController extends HttpServlet{

    @Override
    
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession();
    Account acc = (Account) session.getAttribute("acc");
    String productIDParam = req.getParameter("productID");
    String rawQuantity = req.getParameter("quantity");
    String buyNow = req.getParameter("buyNow");
    
    
    if (productIDParam == null || productIDParam.isEmpty()) {
        resp.sendRedirect("home"); 
        return;
    }
    
    int productID;
    try {
        productID = Integer.parseInt(productIDParam);
    } catch (NumberFormatException e) {
        resp.sendRedirect("home");
        return;
    }
    int quantity;
    if(rawQuantity != null){
        quantity =  Integer.parseInt(rawQuantity);
    }else{
        quantity = 1;
    }
    CartDBContext cDb = new CartDBContext();
    CartDetail cd = new CartDetail();
    Account a = new Account();
    Product p = new Product();
    a.setAccountID(acc.getAccountID());
    cd.setAccount(a);
    cd.setQuantity(quantity);
    p.setProductID(productID);
    cd.setP(p);
    cDb.insert(cd);
    if(buyNow != null){
        resp.sendRedirect("home/cart");
    }else{
        resp.sendRedirect("home");
    }
}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        CategoryDBContext cDb = new CategoryDBContext();
        ArrayList<Category> categories = cDb.all();
        ses.setAttribute("categories", categories);
        req.setAttribute("categories", categories);     
        BlogDAO blogDao = new BlogDAO();
        ArrayList<Blog> blogs = blogDao.getNewBlog();
        ses.setAttribute("blogs", blogs);
        req.setAttribute("blogs", blogs);
        ProductDBContext pDb = new ProductDBContext();
        ArrayList<Product> recProduct = pDb.getRecommendProduct();
        ArrayList<Product> cheapProduct = pDb.getCheapProduct();
        req.setAttribute("recProduct", recProduct);
        req.setAttribute("cheapProduct", cheapProduct);
        req.getRequestDispatcher("views/guest/home.jsp").forward(req, resp);
    }
    
}
