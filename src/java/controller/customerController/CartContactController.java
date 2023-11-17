/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.customerController;

import DAO.CartDBContext;
import DAO.OrderDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import models.Account;
import models.CartDetail;
import models.Order;
import models.OrderInfo;
import models.Product;
import utils.SendMail;

/**
 *
 * @author admin
 */
public class CartContactController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int total = Integer.parseInt(req.getParameter("total"));
        String cusName = req.getParameter("name");
        String email = req.getParameter("email");
        String phoneNum = req.getParameter("phonenum");
        String address = req.getParameter("address");
        String note = req.getParameter("note");
        String payment = req.getParameter("method");
        OrderDBContext odb = new OrderDBContext();
        int orderID = odb.getLastOrder() + 1;
        Order order = new Order();
        order.setPaymentMethod(payment);
        order.setAccount(acc);
        order.setAddress(address);
        order.setCustomerName(cusName);
        order.setEmaill(email);
        order.setNote(note);
        order.setPhoneNumber(phoneNum);
        order.setTotal(total);
        LocalDate currentDate = LocalDate.now();
        Date date = Date.valueOf(currentDate);
        order.setDate(date);
        OrderInfo oi = new OrderInfo();
        oi.setOrderID(orderID);
        CartDBContext cdb = new CartDBContext();
        ArrayList<CartDetail> cds = cdb.getCartByID(acc.getAccountID());
        ArrayList<OrderInfo> ois = new ArrayList<>();
        for (CartDetail cd : cds) {
            OrderInfo newOi = new OrderInfo();
            newOi.setOrderID(orderID);
            Product p = new Product();
            p.setProductID(cd.getP().getProductID());
            newOi.setProduct(p);
            newOi.setPrice(cd.getQuantity() * cd.getP().getPrice());
            newOi.setQuantity(cd.getQuantity());
            ois.add(newOi);
        }
        order.setOrderID(orderID);
        order.setOis(ois);
        odb.insert(order);
        for (OrderInfo oi1 : ois) {
            odb.insertOrderInfo(oi1);
        }
        cdb.deleteCartByAccountID(acc.getAccountID());
        String subject = "Thank you for using my service.";
        String message = "<div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\n"
                + "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\n"
                + "    <div style=\"border-bottom:1px solid #eee\">\n"
                + "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">MobileShop</a>\n"
                + "    </div>\n"
                + "    <p style=\"font-size:1.1em\">Hi,</p>\n"
                + "    <p>Thank you for using my service and if there is anything unsatisfying about the product, "
                + "     please let us know.</p>\n"
                + "    <p>Thanks for purchasing " + cusName + " and have a good day!</p>\n"
                + "    <p>Your Order:</p>\n"
                + "    <table style=\"border=1px; border-collapse: collapse;\">\n"
                + "         <thead style=\"background-color: #e9b7b7\">\n"
                + "             <tr>\n"
                + "                <th style=\"text-align: center; border: none; padding: 8px;\">Name</th>\n"
                + "                <th style=\"text-align: center; border: none; padding: 8px;\">Unit Price</th>\n"
                + "                <th style=\"text-align: center; border: none; padding: 8px;\">Quantity</th>\n"
                + "                <th style=\"text-align: center; border: none; padding: 8px;\">Into Money</th>\n"
                + "             </tr>\n"
                + "         </thead>\n"
                + "         <tbody>\n";
                for(CartDetail cd : cds) {
                    message+= "  <tr>\n"
                + "                 <td style=\"text-align: center; border: none; padding: 8px;\">" + cd.getP().getProductName() + "</td>\n"
                + "                 <td style=\"text-align: center; border: none; padding: 8px;\">" + cd.getP().getPrice() + " $</td>\n"
                + "                 <td style=\"text-align: center; border: none; padding: 8px;\">" + cd.getQuantity()+ "</td>\n"
                + "                 <td style=\"text-align: center; border: none; padding: 8px;\">" + (cd.getP().getPrice() * cd.getQuantity())+ "$</td>\n"
                + "             </tr>\n";
                }
                message += "         </tbody>\n"
                + "    </table>"
                + "    <h4>Total:" + order.getTotal() + "VNĐ</h4>"
                + "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\"></h2>\n"
                + "    <p style=\"font-size:0.9em;\">Regards,<br />MobileShop</p>\n"
                + "    <hr style=\"border:none;border-top:1px solid #eee\" />\n"
                + "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\n"
                + "    </div>\n"
                + "  </div>\n"
                + "</div>";
        SendMail send = new SendMail();
        send.sentMail(email, subject, message);
        resp.sendRedirect("../../cartCompletion?orderID=" + orderID);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        CartDBContext cDb = new CartDBContext();
        ArrayList<CartDetail> cds = cDb.getCartByID(acc.getAccountID());
        req.setAttribute("cds", cds);
        req.getRequestDispatcher("../../views/customer/cartContact.jsp").forward(req, resp);
    }
    
    
}