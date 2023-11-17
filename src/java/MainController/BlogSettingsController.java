/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MainController;

import DAO.BlogDAO;
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
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Blog;
import utils.Pagination;

/**
 *
 * @author toden
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class BlogSettingsController extends HttpServlet {

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
            out.println("<title>Servlet BlogSettings</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogSettings at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        BlogDAO blogdao = new BlogDAO();
        String search = request.getParameter("search");
        if (request.getParameter("del") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            blogdao.delBlogById(id);
        }
        
        List<Blog> blogs = blogdao.all();
        
        if(request.getParameter("orderby")!=null){
            String orderby = request.getParameter("orderby");
            blogs = blogdao.orderBy(request.getParameter("orderby"));
            request.setAttribute("orderby", request.getParameter("orderby"));
            
        }
        
        if(search!=null&&search.trim()!=""){
            List<Blog> Searchblogs = new ArrayList();
            for(Blog b : blogs){
                if(b.getBlogTitle().contains(search)) Searchblogs.add(b);
            }
            blogs = Searchblogs;
        }
        
        if(request.getParameter("currentpage")==null){
            request.setAttribute("pagination", new Pagination(blogs.size(), 1));
        }
        else{
            request.setAttribute("pagination", new Pagination(blogs.size(), Integer.parseInt(request.getParameter("currentpage"))));
        }
        
        request.setAttribute("search", search);
        session.setAttribute("blogs", blogs);
        if(request.getParameter("add")!=null){
            request.getRequestDispatcher("views/BlogAdd.jsp").forward(request, response);
        }else
        request.getRequestDispatcher("views/BlogSettings.jsp").forward(request, response);
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
        // processRequest(request, response);
       HttpSession session = request.getSession();
        BlogDAO blogdao = new BlogDAO();
        ServletContext context = getServletContext();
        String projectPath = context.getRealPath("/");
        List<Part> Parts = (List<Part>) request.getParts();
        Account acc = (Account) session.getAttribute("acc");
        String title = request.getParameter("title");
        String detail = request.getParameter("detail");
        blogdao.addBlog(title, detail, acc.getAccountID());
        //add image file
        for (Part part : Parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null) {
                part.write(projectPath + "images\\blogImage\\" + fileName);
                blogdao.addBlogImg(fileName);
            }
        }
        //
        response.sendRedirect("BlogSettings");
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
