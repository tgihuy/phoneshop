/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MainController;

import DAO.OrderDBContext;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import models.Order;

/**
 *
 * @author admin
 */
public class SaleDashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaleDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDBContext odb = new OrderDBContext();
        List<Order> orders = odb.all();
        Gson gson = new Gson();
        String jsonOrderList = gson.toJson(orders);
        int total = 0;
        int totaltoday = 0;
        int ordertoday = 0;
        SimpleDateFormat localDateFormat = new SimpleDateFormat("MM-dd-yyyy");
        for (Order o : orders) {
            Date orderDate = o.getDate();
            String orderDateStr = localDateFormat.format(orderDate);
            String currentDateStr = localDateFormat.format(new Date());
            if (!"Cancel".equals(o.getOrderStatus().getOrderStatusName())
                    && !"Fail To Delivery".equals(o.getOrderStatus().getOrderStatusName())) {  
                total += o.getTotal(); 
                try {
                    if (orderDateStr.equals(currentDateStr)) {
                        ordertoday++;
                        totaltoday += o.getTotal();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else{
                if (orderDateStr.equals(currentDateStr)) {
                        ordertoday++;
                    }
            }
        }
        request.setAttribute("jsonOrderList", jsonOrderList);
        request.setAttribute("orders", orders);
        request.setAttribute("total", total);
        request.setAttribute("totaltoday", totaltoday);
        request.setAttribute("ordertoday", ordertoday);
        request.getRequestDispatcher("views/SaleDashboard.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
