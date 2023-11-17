/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;
import models.Product;
import models.ProductImage;

/**
 *
 * @author admin
 */
public class ProductDBContext extends DBContext<Product> {

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select p.productID,p.productName,c.categoryID,c.categoryName,p.price,"
                    + " p.status,p.details,img.imageID, img.url from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID \n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID\n";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setDetails(rs.getString("details"));
                p.setStatus(rs.getBoolean("status"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                p.setCategory(c);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public ArrayList<Product> searchProductByName(String productName) {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT p.productID, p.productName, c.categoryID, c.categoryName, p.price, p.status, p.details, img.imageID, img.url "
                    + "FROM product p "
                    + "INNER JOIN productImage img ON p.productID = img.productID "
                    + "INNER JOIN category c ON c.categoryID = p.categoryID "
                    + "WHERE p.productName LIKE ?";
            stm = connection.prepareStatement(sql);
            // Set the parameter for the product name search
            stm.setString(1, "%" + productName + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setDetails(rs.getString("details"));
                p.setStatus(rs.getBoolean("status"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                p.setCategory(c);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public ArrayList<Product> getRecProduct() {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select p.productID,p.productName,c.categoryID,c.categoryName,p.price,"
                    + " p.status,p.details,img.imageID, img.url from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID \n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID\n"
                    + "where p.productID in (1,2,7)";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setDetails(rs.getString("details"));
                p.setStatus(rs.getBoolean("status"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                p.setCategory(c);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public void deleteById(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update product set status = 0 where productID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> getProductsByCateID(int id) {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select p.productID, p.productName,c.categoryID,c.categoryName,"
                    + " p.price, p.status, img.imageID, img.url, details from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID\n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID where p.categoryID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setStatus(rs.getBoolean("status"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                p.setCategory(c);
                p.setProductImage(pImg);
                p.setDetails(rs.getString("details"));
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public void updateProduct(int categoryID, String name, String detail, int price, int productID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update product set categoryID = ?, productName = ?, details = ?, price = ? where productID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            stm.setNString(2, name);
            stm.setNString(3, detail);
            stm.setInt(4, price);
            stm.setInt(5, productID);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateProductImg(String part, int productID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update productImage set url = ? where productID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(2, productID);
            stm.setString(1, part);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addProductImg(String part) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into productImage(productID,url) values(?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, getNewestProduct());
            stm.setString(2, part);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addProduct(int categoryID, String name, String detail, int price) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into product values(?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            stm.setNString(2, name);
            stm.setNString(3, detail);
            stm.setInt(4, price);
            stm.setBoolean(5, true);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNewestProduct() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 1 productID from [dbo].[product] order by productID desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public void insert(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Product get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select p.productID, p.productName,c.categoryID,c.categoryName,"
                    + " p.price, p.status, img.imageID, img.url, details from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID\n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID where p.productID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setStatus(rs.getBoolean("status"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                p.setCategory(c);
                p.setProductImage(pImg);
                p.setDetails(rs.getNString("details"));
                return (p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Product> all() {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select p.productID, p.productName,c.categoryID,c.categoryName,"
                    + " p.price, p.status, img.imageID, img.url from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID\n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setStatus(rs.getBoolean("status"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                p.setCategory(c);
                p.setProductImage(pImg);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getRecommendProduct() {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 10 p.productID,p.productName,c.categoryID,c.categoryName,p.price,"
                    + " p.status,p.details,img.imageID, img.url from product p \n"
                    + "inner join productImage img\n"
                    + "on p.productID = img.productID \n"
                    + "inner join category c\n"
                    + "on c.categoryID = p.categoryID\n"
                    + "where p.categoryID in (1,2,3)";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setDetails(rs.getString("details"));
                p.setStatus(rs.getBoolean("status"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                p.setCategory(c);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public ArrayList<Product> getCheapProduct() {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 8 p.productID,p.productName,c.categoryID,c.categoryName,p.price, \n"
                    + "p.status,p.details,img.imageID, img.url from product p inner join productImage img on p.productID = img.productID inner join category c \n"
                    + "on c.categoryID = p.categoryID order by p.price asc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setDetails(rs.getString("details"));
                p.setStatus(rs.getBoolean("status"));
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                ProductImage pImg = new ProductImage();
                pImg.setImageID(rs.getInt("imageID"));
                pImg.setUrl(rs.getString("url"));
                p.setProductImage(pImg);
                p.setCategory(c);
                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }
}
