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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import models.Account;
import models.Order;

/**
 *
 * @author admin
 */
public class OrderController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status");
        if(status == null){
            status ="0";
        }
        int parseStatus = Integer.parseInt(status);
        String value = req.getParameter("value");
        String name = req.getParameter("name");
        String date = req.getParameter("date");
        if(name == null || name.isEmpty()){
            name = "0";
        }
        if(date == null || date.isEmpty()){
            date = "0";
        }
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("acc");
        OrderDBContext odb = new OrderDBContext();
        ArrayList<Order> orders = odb.getOrdersByAccountIDAndName(account.getAccountID(), name,date,parseStatus);    
        ArrayList<Order> filterOrders = filterOrders(orders);
        if(value != null){
            if(Integer.parseInt(value) == 0){
                sortByPrice(false,filterOrders);
            }
            if(Integer.parseInt(value) == 1){
                sortByPrice(true,filterOrders);
            }
        }
        req.setAttribute("orders", filterOrders);

        req.getRequestDispatcher("views/customer/order.jsp").forward(req, resp);

    }
    
    private void sortByPrice(boolean isAsc, ArrayList<Order> orders){
        Collections.sort(orders, new Comparator<Order>() {
            @Override
            public int compare(Order o1, Order o2) {
                if(isAsc){
                    return Integer.compare(o1.getTotal(), o2.getTotal());
                }else{
                    return Integer.compare(o2.getTotal(), o1.getTotal());
                }    
            }           
        });
    }
    
      private ArrayList<Order> filterOrders(ArrayList<Order> orders) {
        ArrayList<Order> filteredOrders = new ArrayList<>();
        HashSet<Integer> uniqueIds = new HashSet<>();

        for (Order order : orders) {
            if (!uniqueIds.contains(order.getOrderID())) {
                uniqueIds.add(order.getOrderID());
                filteredOrders.add(order);
            }
        }

        return filteredOrders;
    }
    
}
