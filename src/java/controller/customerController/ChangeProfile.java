/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customerController;

import DAO.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author win
 */
public class ChangeProfile extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        System.out.println("Bat dau lay thong tin de thay doi ");
        AccountDBContext accountDBContext = new AccountDBContext() {
        };
        Account accounts = accountDBContext.getAccountByID(acc.getAccountID());
        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("/views/customer/changeProfile.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        AccountDBContext accountDBContext = new AccountDBContext() {
        };
        Account accounts = accountDBContext.getAccountByID(acc.getAccountID());

        String newName = request.getParameter("fullname");
        String newPhone = request.getParameter("phone");
        String newAddress = request.getParameter("address");
        boolean isNameValid = isValidName(newName);
        boolean isPhoneValid = isValidPhoneNumber(newPhone);

        if (isNameValid && isPhoneValid) {
            System.out.println("chay update profile");
            accountDBContext.updateProfile(acc.getAccountID(), acc.getEmail(), acc.getPassword(), newName, newPhone, newAddress);
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            System.out.println("Invalid name or phone");
            if (!isNameValid) {
                request.setAttribute("checkName", "Your name is invalid");
                System.out.println("Check name");
            }
            if (!isPhoneValid) {
                request.setAttribute("checkPhone", "Your phone is invalid (0xxxxxxxxx)");
                System.out.println("check phone");
            }
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("/views/customer/changeProfile.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
public static boolean isValidName(String name) {
        // Kiểm tra tên không được để trống và không chứa khoảng trắng đầu hoặc cuối chuỗi
        if (name == null || name.trim().length() == 0 || name.startsWith(" ") || name.endsWith(" ")) {
            return false;
        }

        // Kiểm tra tên không chứa các ký tự đặc biệt hoặc số
        if (!name.matches("[\\p{L} ]+")) {
            return false;
        }

        // Kiểm tra tên không quá ngắn hoặc quá dài
        if (name.length() < 2 || name.length() > 50) {
            return false;
        }

        // Tên hợp lệ
        return true;
    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        // Xóa khoảng trắng và các ký tự không phải số
        String cleanedPhoneNumber = phoneNumber.replaceAll("[^0-9]", "");

        // Kiểm tra độ dài của số điện thoại
        if (cleanedPhoneNumber.startsWith("+84") && cleanedPhoneNumber.length() != 12) {
            return false;
        } else if (cleanedPhoneNumber.startsWith("0") && cleanedPhoneNumber.length() != 10 && cleanedPhoneNumber.length() != 11) {
            return false;
        }

        // Kiểm tra đầu số của số điện thoại
        String prefix = cleanedPhoneNumber.substring(0, 2);
        if (!prefix.equals("09") && !prefix.equals("03") && !prefix.equals("07") && !prefix.equals("08") && !prefix.equals("84")) {
            return false;
        }

        // Kiểm tra xem số điện thoại chỉ chứa các ký tự số
        if (!cleanedPhoneNumber.matches("[0-9]+")) {
            return false;
        }

        // Số điện thoại hợp lệ
        return true;
    }
}
