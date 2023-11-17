/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Blog {
    private Account account;
    private int blogID;
    private String blogTitle;
    private BlogImage blogImage;
    private String blogDetail;
    Date date;
    boolean status;

    public String getBlogTitle() {
        return blogTitle;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    
    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
   
    public BlogImage getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(BlogImage blogImage) {
        this.blogImage = blogImage;
    }

    public String getBlogDetail() {
        return blogDetail;
    }

    public void setBlogDetail(String blogDetail) {
        this.blogDetail = blogDetail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
}
