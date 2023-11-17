/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Like;

/**
 *
 * @author admin
 */
public class LikeDBContext extends DBContext<Like>{

    @Override
    public void insert(Like model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Like model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Like model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Like get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Like> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<Like> getLikeListByFeedBackID(int id){
        List<Like> likes = new ArrayList();
        String sql = "select * from [like] where feedbackID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                likes.add(new Like(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3)
                ));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return likes;
    }
    
    public void addLike(int accountID, int feedbackID){
        String sql = "insert into [like] values(?,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedbackID);
            ps.setInt(2, accountID);
            ps.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void DelLike(int accountID, int feedbackID){
        String sql = "delete [like] where accountID = ? and feedbackID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setInt(2, feedbackID);
            ps.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    
}
