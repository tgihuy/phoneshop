/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.Blog;
import models.BlogImage;

/**
 *
 * @author toden
 */
public class BlogDAO extends DBContext<Blog> {

    public void addBlogImg(String part) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into blogImage(blogID,url) values(?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, getNewestBlog());
            stm.setString(2, part);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdateBlogImg(String part, int blogID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update blogImage set url = ? where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(2, blogID);
            stm.setString(1, part);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addBlog(String title, String detail, int accid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into blog(accountID,blogTitle,blogDetail,date,status) values(?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accid);
            stm.setNString(2, title);
            stm.setNString(3, detail);
            stm.setDate(4, new java.sql.Date(new Date().getTime()));
            stm.setBoolean(5, true);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateBlog(String title, String detail, int blogid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update blog set blogTitle = ?,blogDetail = ? where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(3, blogid);
            stm.setNString(1, title);
            stm.setNString(2, detail);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNewestBlog() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 1 blogID from [dbo].[blog] order by blogID desc";
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

    public ArrayList<Blog> getRecentPost() {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {
            String sql = "select top 3 b.accountID, b.blogID, b.blogTitle, b.blogDetail ,b.date, b.status, bi.imageID, bi.url \n"
                    + "from blog b inner join blogImage bi on b.blogID = bi.blogID where status = 1\n"
                    + "order by date desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlogID(rs.getInt("blogID"));
                b.setBlogTitle(rs.getNString("blogTitle"));
                b.setBlogDetail(rs.getNString("blogDetail"));
                BlogImage bi = new BlogImage();
                bi.setUrl(rs.getString("url"));
                b.setBlogImage(bi);
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }
    
    public BlogImage getBlogImageByid(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [dbo].[blogImage] where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                BlogImage b = new BlogImage();
                b.setBlogID(id);
                b.setImageID(rs.getInt(2));
                b.setUrl(rs.getString(3));
                return (b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public void delBlogById(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update [dbo].[blog] set status = 0 where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Blog getDetailPost(int id) {
        Blog b = new Blog();
        try {
            String sql = "select b.blogTitle,a.fullname,b.date,b.blogDetail, bi.url\n"
                    + "from blog b,account a, blogImage bi\n"
                    + "where a.accountID = b.accountID and b.blogID = bi.blogID\n"
                    + "and b.blogID= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b.setBlogTitle(rs.getNString("blogTitle"));
                b.setBlogDetail(rs.getNString("blogDetail"));
                b.setDate(rs.getDate("date"));
                BlogImage bi = new BlogImage();
                bi.setUrl(rs.getString("url"));
                b.setBlogImage(bi);
                Account a = new Account();
                a.setFullName(rs.getNString("fullname"));
                b.setAccount(a);
            }
        } catch (SQLException e) {
        }
        return b;
    }

    @Override
    public void insert(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Blog get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from blog where blogID=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt(1)));
                b.setBlogID(id);
                b.setBlogTitle(rs.getNString(3));
                b.setBlogDetail(rs.getNString(4));
                b.setDate(rs.getDate(5));
                b.setStatus(rs.getBoolean(6));
                b.setBlogImage(getBlogImageByid(id));
                return (b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    @Override
    public ArrayList<Blog> all() {
        ArrayList<Blog> blogs = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select b.accountID, b.blogID, b.blogTitle, substring(b.blogDetail,0,70) as BlogDetail, b.date, b.status, bi.imageID, bi.url \n"
                    + "from blog b inner join blogImage bi on b.blogID = bi.blogID where status = 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt("accountID")));
                b.setBlogID(rs.getInt("blogID"));
                b.setBlogTitle(rs.getNString("blogTitle"));
                b.setBlogDetail(rs.getNString("blogDetail"));
                b.setDate(rs.getDate("date"));
                b.setStatus(rs.getBoolean("status"));
                BlogImage bi = new BlogImage();
                bi.setImageID(rs.getInt("imageID"));
                bi.setUrl(rs.getString("url"));
                b.setBlogImage(bi);
                blogs.add(b);
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
        return blogs;
    }
    
    public ArrayList<Blog> orderBy(String orderby) {
        ArrayList<Blog> blogs = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select b.accountID, b.blogID, b.blogTitle, b.blogDetail, "
                    + "b.date, b.status, bi.imageID, bi.url from blog b\n" 
                    + "inner join blogImage bi on b.blogID = bi.blogID where b.status = 1"+" order by b."+orderby ;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt("accountID")));
                b.setBlogID(rs.getInt("blogID"));
                b.setBlogTitle(rs.getNString("blogTitle"));
                b.setBlogDetail(rs.getNString("blogDetail"));
                b.setDate(rs.getDate("date"));
                b.setStatus(rs.getBoolean("status"));
                BlogImage bi = new BlogImage();
                bi.setImageID(rs.getInt("imageID"));
                bi.setUrl(rs.getString("url"));
                b.setBlogImage(bi);
                blogs.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return blogs;
    }
    
    public ArrayList<Blog> getNewBlog() {
        ArrayList<Blog> blogs = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 3 b.accountID, b.blogID, b.blogTitle, SUBSTRING(b.blogDetail, 0, 50) as blogDetail, \n"
                    + "b.date, b.status, bi.imageID, bi.url from blog b inner join blogImage bi on b.blogID = bi.blogID order by b.date desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt("accountID")));
                b.setBlogID(rs.getInt("blogID"));
                b.setBlogTitle(rs.getNString("blogTitle"));
                b.setBlogDetail(rs.getNString("blogDetail"));
                b.setDate(rs.getDate("date"));
                b.setStatus(rs.getBoolean("status"));
                BlogImage bi = new BlogImage();
                bi.setImageID(rs.getInt("imageID"));
                bi.setUrl(rs.getString("url"));
                b.setBlogImage(bi);
                blogs.add(b);
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
        return blogs;
    }
}
