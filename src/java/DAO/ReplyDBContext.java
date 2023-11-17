/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Reply;

/**
 *
 * @author admin
 */
public class ReplyDBContext extends DBContext<Reply> {

    @Override
    public void insert(Reply model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Reply model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Reply model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Reply get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Reply> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<Reply> getReplyListByFeedBackID(int id){
        List<Reply> replys = new ArrayList();
        String sql = "select * from reply where feedbackID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                replys.add(new Reply(
                        rs.getInt(1),
                        rs.getNString(2),
                        new AccountDBContext().get(rs.getInt(3)),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6)
                ));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return replys;
    }
    
    public void addReply(String content, int accountID, int feedbackID){
        String sql = "insert into reply(content, accountID, feedbackID) values(?,?,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, content);
            ps.setInt(2, accountID);
            ps.setInt(3, feedbackID);
            ps.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void delReply(int replyID){
        String sql = "update reply set isDeleted = 1 where replyID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, replyID);
            ps.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}

