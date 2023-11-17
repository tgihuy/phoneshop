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
import models.Account;
import models.CartDetail;
import models.Product;

/**
 *
 * @author admin
 */
public class DeleteCartController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int pID = Integer.parseInt(req.getParameter("pid"));
        Account a = new Account();
        a.setAccountID(acc.getAccountID());
        Product p = new Product();
        p.setProductID(pID);
        CartDetail cd = new CartDetail();
        cd.setP(p);
        cd.setAccount(a);
        CartDBContext cDB = new CartDBContext();
        cDB.delete(cd);
        resp.sendRedirect("home/cart");
    }
    
}
