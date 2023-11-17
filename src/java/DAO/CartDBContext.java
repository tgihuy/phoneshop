/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.CartDetail;
import models.Product;
import models.ProductImage;

/**
 *
 * @author admin
 */
public class CartDBContext extends DBContext<CartDetail>{
    
    public void deleteCartByAccountID(int id){
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM cartDetail WHERE accountID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public ArrayList<CartDetail> getCartByID(int id){
         ArrayList<CartDetail> cds = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT c.productID, p.productName, P.price,pi.url, SUM(c.quantity) AS quantity FROM cartDetail c\n"
                    + "         INNER JOIN productImage pi ON c.productID = pi.productID\n"
                    + "         INNER JOIN product p ON c.productID = p.productID\n"
                    + "         WHERE c.accountID = ? AND c.status = 1\n"
                    + "         GROUP BY c.productID, p.productName, P.price,pi.url\n"
                    + "         ORDER BY quantity DESC;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                Product p = new Product();
                a.setAccountID(id);
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                ProductImage pImg = new ProductImage();
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                CartDetail cd = new CartDetail();
                cd.setAccount(a);
//                cd.setCartID(rs.getInt("cartID"));
                cd.setQuantity(rs.getInt("quantity"));
                cd.setP(p);
                cds.add(cd);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return cds;
    }
    
    @Override
    public void insert(CartDetail model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO cartDetail ([accountID],[productID] ,[quantity], [status]) VALUES(?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1,model.getAccount().getAccountID());
            stm.setInt(2,model.getP().getProductID());
            stm.setInt(3,model.getQuantity());
            stm.setBoolean(4,true);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(CartDetail model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(CartDetail model) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[cartDetail] WHERE productID = ? and accountID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getP().getProductID());
            stm.setInt(2, model.getAccount().getAccountID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public CartDetail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<CartDetail> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
