/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guestController;

import DAO.AccountDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.encrypt;

/**
 *
 * @author Asus
 */
public class ActiveUsersServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDBContext uDao = new AccountDBContext();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String code = (String) session.getAttribute("code");

        String trueCode = request.getParameter("validateCode");

        if (trueCode.equals(code)) {
            return true;

        }
        return false;
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
        processRequest(request, response);
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
        if (processRequest(request, response)) {
            AccountDBContext uDao = new AccountDBContext();
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String pass = (String) session.getAttribute("pass");
            String passConvert = encrypt.toSHA1(pass);
            String name = (String) session.getAttribute("fullname");
            String address = (String) session.getAttribute("address");
            String phoneNumber = (String) session.getAttribute("phone");
            uDao.checkSignup(email, passConvert, name, phoneNumber, address);
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Your verification code is wrong!");
            request.getRequestDispatcher("views/guest/registerCodeMail.jsp").forward(request, response);
        }
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
