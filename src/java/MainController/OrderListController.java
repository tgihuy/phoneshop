/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MainController;

import DAO.OrderDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import models.Order;
import utils.Pagination;

/**
 *
 * @author admin
 */
public class OrderListController extends HttpServlet {

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
            out.println("<title>Servlet OrderList</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderList at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        OrderDBContext odb = new OrderDBContext();
        List<Order> orders = odb.all2();
        
        String search = request.getParameter("search");
        String orderby = request.getParameter("orderby");
        if(orderby!=null&&!orderby.equalsIgnoreCase("All")){
                orders = odb.allOrderBy(orderby);
                request.setAttribute("orderby", orderby);
        }
        if(search!=null){
            orders = search(orders, search);
            request.setAttribute("search", search);
        }
        
        if(request.getParameter("currentpage")==null){
            request.setAttribute("pagination", new Pagination(orders.size(), 1));
        }
        else{
            request.setAttribute("pagination", new Pagination(orders.size(), Integer.parseInt(request.getParameter("currentpage"))));
        }
        
        session.setAttribute("orders", orders);
        request.getRequestDispatcher("views/OrderList.jsp").forward(request, response);
    }
    
    private List<Order> search(List<Order> orders, String search){
        List<Order> searchList = new ArrayList();
        for(Order o : orders){
            if(o.getAccount().getFullName().contains(search)){
                searchList.add(o);
            }
        }
        return searchList;
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

