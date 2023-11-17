/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.customerController;

import DAO.OrderDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import models.Order;
import models.OrderInfo;

/**
 *
 * @author admin
 */
public class orderDetailController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        OrderDBContext odb = new OrderDBContext();
        Order order = odb.getOrderByID(id);
        req.setAttribute("order", order);
        ArrayList<OrderInfo> ois = odb.getOrderInfoByID(id);
        req.setAttribute("ois", ois);
        req.getRequestDispatcher("../views/customer/orderDetail.jsp").forward(req, resp);
    }
    
}
