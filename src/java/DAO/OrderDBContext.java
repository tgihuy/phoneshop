/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;
import models.OrderInfo;
import models.OrderStatus;
import models.Product;
import models.ProductImage;

/**
 *
 * @author admin
 */
public class OrderDBContext extends DBContext<Order> {

    public void insertOrderInfo(OrderInfo model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[orderInfo]([orderID],[productID],[quantity])\n"
                    + "VALUES(?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getOrderID());
            stm.setInt(2, model.getProduct().getProductID());
            stm.setInt(3, model.getQuantity());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Order> allOrderBy(String orderBy) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [order] order by " + orderBy;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setAccount(new AccountDBContext().get(rs.getInt(1)));
                o.setOrderID(rs.getInt(2));
                o.setTotal(rs.getInt(3));
                o.setDate(rs.getDate(4));
                o.setAddress(rs.getNString(5));
                o.setNote(rs.getNString(6));
                o.setOrderStatus(getOrderStatusByID(rs.getInt(7)));
                o.setOis(getOrderInfoByID(rs.getInt(2)));
                orders.add(o);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> all2() {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [order]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setAccount(new AccountDBContext().get(rs.getInt(1)));
                o.setOrderID(rs.getInt(2));
                o.setTotal(rs.getInt(3));
                o.setDate(rs.getDate(4));
                o.setAddress(rs.getNString(5));
                o.setNote(rs.getNString(6));
                o.setOrderStatus(getOrderStatusByID(rs.getInt(7)));
                o.setOis(getOrderInfoByID(rs.getInt(2)));
                orders.add(o);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public OrderStatus getOrderStatusByID(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from orderStatus where orderStatusID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderStatus os = new OrderStatus();
                os.setOrderStatusID(rs.getInt(1));
                os.setOrderStatusName(rs.getNString(2));
                return os;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<OrderInfo> getOrderInfoByID(int id) {
        ArrayList<OrderInfo> ois = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select oi.productID,p.productName ,oi.quantity, p.price, pi.url \n"
                    + "from orderInfo oi inner join product p on oi.productID = p.productID\n"
                    + "inner join productImage pi on p.productID = pi.productID\n"
                    + "where oi.orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(id);
                oi.setQuantity(rs.getInt("quantity"));
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                ProductImage pi = new ProductImage();
                pi.setUrl(rs.getString("url"));
                p.setProductImage(pi);
                oi.setProduct(p);
                ois.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ois;
    }

    public Order getOrderByID(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select o.customerName,o.date,o.total,o.address,o.note,os.orderStatusID,os.orderStatusName from [order] o \n"
                    + "inner join orderStatus os \n"
                    + "on o.orderStatusID = os.orderStatusID\n"
                    + "where o.orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setOrderID(id);
                o.setCustomerName(rs.getString("customerName"));
                o.setDate(rs.getDate("date"));
                o.setTotal(rs.getInt("total"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusName(rs.getString("orderStatusName"));
                os.setOrderStatusID(rs.getInt("orderStatusID"));
                o.setOrderStatus(os);
                return o;
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public ArrayList<Order> getOrdersByAccountIDAndName(int id, String name, String date, int status) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "  select distinct o.orderID, o.customerName,p.productID,p.productName ,o.paymentMethod, o.total,\n"
                    + "               o.date, os.orderStatusName from [order] o\n"
                    + "               inner join orderStatus os\n"
                    + "               on o.orderStatusID = os.orderStatusID\n"
                    + "		      inner join orderInfo oi\n"
                    + "	              on oi.orderID = o.orderID\n"
                    + "		      inner join product p\n"
                    + "		      on p.productID = oi.productID\n"
                    + "               where o.accountID = ? \n";
            if (!name.equals("0")) {
                sql += "and p.productName like '%" + name + "%'\n";
            }
            if (status != 0) {
                sql += "and o.orderStatusID = " + status;
            }
            if (!date.equals("0")) {
                sql += "and o.date = '" + date + "'";
            }
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setCustomerName(rs.getString("customerName"));
                order.setOrderID(rs.getInt("orderID"));
//                OrderInfo oi = new OrderInfo();
//                oi.setOrderID(rs.getInt("orderID"));
//                Product p = new Product();
//                p.setProductID(rs.getInt("productID"));
//                p.setProductName(rs.getString("productName"));
//                oi.setProduct(p);
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setTotal(rs.getInt("total"));
                order.setDate(rs.getDate("date"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusName(rs.getString("orderStatusName"));
                List<OrderInfo> ois = getOrderInfoByID(rs.getInt("orderID"));
                order.setOis(ois);
                order.setOrderStatus(os);
                orders.add(order);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

    @Override
    public void update(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Order> all() {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select o.orderID,o.customerName,o.email,o.address,o.phoneNumber,o.note,o.date,o.total\n"
                    + "  ,o.paymentMethod,o.orderStatusID,os.orderStatusName from [order] o\n"
                    + "  inner join orderStatus os\n"
                    + "  on o.orderStatusID = os.orderStatusID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("orderID"));
                order.setEmaill(rs.getString("email"));
                order.setPhoneNumber(rs.getString("phoneNumber"));
                order.setTotal(rs.getInt("total"));
                order.setAddress(rs.getString("address"));
                order.setCustomerName(rs.getString("customerName"));
                order.setDate(rs.getDate("date"));
                order.setNote(rs.getString("note"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusID(rs.getInt("orderStatusID"));
                os.setOrderStatusName(rs.getString("orderStatusName"));
                order.setOrderStatus(os);
                List<OrderInfo> ois = getOrderInfoByID(rs.getInt("orderID"));
                order.setOis(ois);
                orders.add(order);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

    @Override
    public void insert(Order model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "([accountID],[orderID],[total],[date],[address],[note],[orderStatusID],"
                    + "[customerName],[phoneNumber],[email],[paymentMethod])\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getAccount().getAccountID());
            stm.setInt(2, model.getOrderID());
            stm.setInt(3, model.getTotal());
            stm.setDate(4, model.getDate());
            stm.setString(5, model.getAddress());
            stm.setString(6, model.getNote());
            stm.setInt(7, 1);
            stm.setString(8, model.getCustomerName());
            stm.setString(9, model.getPhoneNumber());
            stm.setString(10, model.getEmaill());
            stm.setString(11, model.getPaymentMethod());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<OrderStatus> getAllOrderStatus() {
        ArrayList<OrderStatus> OrderStatuses = new ArrayList<>();
        String sql = "select * from [orderStatus]";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderStatus oi = new OrderStatus();
                oi.setOrderStatusID(rs.getInt(1));
                oi.setOrderStatusName(rs.getString(2));
                OrderStatuses.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderStatuses;
    }

    public List<OrderInfo> getOrderInfoByOrderID(int oid) {
        ArrayList<OrderInfo> OrderInfos = new ArrayList<>();
        String sql = "select * from [orderInfo] where orderID = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, oid);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(rs.getInt(1));
                oi.setProduct(new ProductDBContext().get(rs.getInt(2)));
                oi.setQuantity(rs.getInt(3));
                OrderInfos.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderInfos;
    }

    @Override
    public Order get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [order] where orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setAccount(new AccountDBContext().get(rs.getInt(1)));
                o.setOrderID(rs.getInt(2));
                o.setTotal(rs.getInt(3));
                o.setDate(rs.getDate(4));
                o.setAddress(rs.getNString(5));
                o.setNote(rs.getNString(6));
                o.setOrderStatus(getOrderStatusByID(rs.getInt(7)));
                o.setOis(getOrderInfoByID(rs.getInt(2)));
                return o;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrderStatus(int orderId, int orderStatus, double total, String date, String address, String note) {
        String sql = "update [order] set orderStatusID = ?, total = ?, date = ?, address = ?, note = ? where orderID = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderStatus);
            stm.setDouble(2, total);
            stm.setString(3, date);
            stm.setString(4, address);
            stm.setString(5, note);
            stm.setInt(6, orderId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrderStatus2(int orderId, int orderStatus) {
        String sql = "update [order] set orderStatusID = ? where orderID = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderStatus);
            stm.setInt(2, orderId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void cancelOrderStatus(String id, String ss){
        String sql = "update [order] set orderStatusID = "+ss+" where orderID = " +id;
        PreparedStatement stm = null;
            System.out.println(sql);
        try {
            stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public static void main(String[] args) {
        new OrderDBContext().cancelOrderStatus("1", "5");
    }

    public int getLastOrder(){
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select top 1 orderID from [order] order by orderID desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
