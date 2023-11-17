/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MainController;

import DAO.CategoryDBContext;
import DAO.ProductDBContext;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;
import models.Account;
import models.Category;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ProductUpdateController extends HttpServlet {

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
            out.println("<title>Servlet ProductUpdate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductUpdate at " + request.getContextPath() + "</h1>");
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
        ProductDBContext pdb = new ProductDBContext();
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", pdb.get(id));
        request.setAttribute("categories", new CategoryDBContext().all());
        request.getRequestDispatcher("views/UpdateProduct.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        ProductDBContext pdb = new ProductDBContext();
        CategoryDBContext cdb = new CategoryDBContext();
        ServletContext context = getServletContext();
        String projectPath = context.getRealPath("/");
        List<Part> Parts = (List<Part>) request.getParts();
        Account acc = (Account) session.getAttribute("acc");
        String title = request.getParameter("title");
        String detail = request.getParameter("detail");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        Category cate = cdb.get(categoryId);
        int price = Integer.parseInt(request.getParameter("price"));
        int id = Integer.parseInt(request.getParameter("id"));
        pdb.updateProduct(categoryId, title, detail, price, id);
        //add image file
        for (Part part : Parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null) {
                part.write(projectPath + "images\\" + fileName);
                pdb.UpdateProductImg(fileName, id);
            }
        }
        response.sendRedirect("productSettings");
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
