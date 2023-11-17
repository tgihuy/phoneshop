/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.customerController;

import DAO.CartDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import models.Account;
import models.CartDetail;
import models.Product;

/**
 *
 * @author admin
 */
public class CartController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String[] productID = req.getParameterValues("productID");
        String[] quantity = req.getParameterValues("quantity");
        ArrayList<CartDetail> cds = new ArrayList<>();
        for (int i = 0; i < productID.length; i++) {
            int pID = Integer.parseInt(productID[i]);
            Product p = new Product();
            p.setProductID(pID);
            int num = Integer.parseInt(quantity[i]);
            cds.add(new CartDetail(acc,p,num,true));
        }
        CartDBContext cdb = new CartDBContext();
        cdb.deleteCartByAccountID(acc.getAccountID());
        for (CartDetail cd : cds) {
            cdb.insert(cd);
        }
        resp.sendRedirect("cart/cartContact");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        CartDBContext cDb = new CartDBContext();
        ArrayList<CartDetail> cds = cDb.getCartByID(acc.getAccountID());
        req.setAttribute("cds", cds);
        req.getRequestDispatcher("../views/customer/cart.jsp").forward(req, resp);
    }
    
}
