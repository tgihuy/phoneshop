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
import models.Category;

/**
 *
 * @author admin
 */
public class CategoryDBContext extends DBContext<Category> {

    @Override
    public void insert(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Category get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select categoryID, categoryName, describe, catImage from category where categoryID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category ca = new Category();
                ca.setCategoryID(rs.getInt("categoryID"));
                ca.setCategoryName(rs.getString("categoryName"));
                ca.setDescribe(rs.getString("describe"));
                ca.setCatImage(rs.getString("catImage"));
                return ca;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;    
    }

    @Override
    public ArrayList<Category> all() {
        ArrayList<Category> categories = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select categoryID, categoryName, describe, catImage from category";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category ca = new Category();
                ca.setCategoryID(rs.getInt("categoryID"));
                ca.setCategoryName(rs.getString("categoryName"));
                ca.setDescribe(rs.getString("describe"));
                ca.setCatImage(rs.getString("catImage"));
                categories.add(ca);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return categories;
    }

}
