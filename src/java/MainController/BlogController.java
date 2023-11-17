/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MainController;

import DAO.BlogDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import models.Blog;

/**
 *
 * @author win
 */
public class BlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BlogDAO dao = new BlogDAO();
        ArrayList<Blog> list = dao.all();
        ArrayList<Blog> list2 = dao.getRecentPost();
//        request.setAttribute("bloList", list);
        request.setAttribute("latestList", list2);
        String sortOrder = request.getParameter("order");
        if (sortOrder == null) {
            // Default to sorting from New To Old if no selection is made
            sortOrder = "NTO";
        }

        if (sortOrder.equals("OTN")) {
            // Sort the list from Old To New
            Collections.sort(list, Comparator.comparing(Blog::getDate));
        } else {
            // Sort the list from New To Old (default)
            Collections.sort(list, Comparator.comparing(Blog::getDate).reversed());
        }
        int itemsPerPage = 6;

        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }
        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, list.size());

        List<Blog> currentPageBlogs = list.subList(startIndex, endIndex);

        int totalPages = (int) Math.ceil((double) list.size() / itemsPerPage);
        request.setAttribute("bloList", currentPageBlogs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("views/BlogList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
