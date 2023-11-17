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

import models.Role;

/**
 *
 *
 * @author asus
 */
public class AccountDBContext extends DBContext<Account> {

    PreparedStatement stm = null;
    ResultSet rs = null;

    public Account getAccountByID(int accountID) {

        try {

            String sql = "SELECT a.accountID, a.email, a.password, a.roleID, a.fullname, a.phonenum, a.address, a.status, r.roleName FROM Account a "
                    + "INNER JOIN Role r ON a.roleID = r.roleID WHERE a.accountID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                Role role = new Role();
                role.setRoleID(rs.getInt("roleID"));
                role.setRoleName(rs.getString("roleName"));
                account.setRole(role);
                account.setFullName(rs.getString("fullname"));
                account.setPhoneNumber(rs.getString("phonenum"));
                account.setAddress(rs.getString("address"));
                account.setStatus(rs.getBoolean("status"));

                role.setRoleID(rs.getInt("roleID"));
                role.setRoleName(rs.getString("roleName"));

                account.setRole(role);
                System.out.println("Lay thong tin profile thanh cong " + accountID);
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
     public Account getAccByEmail(String email) {

        try {
            String sql = "select * from account where email = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountID(rs.getInt(1));
                a.setEmail(email);
                a.setPassword(rs.getString(3));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setAddress(rs.getString(7));
                a.setStatus(rs.getBoolean(8));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;

    }

    public void updateProfile(int accountID, String email, String password, String fullname, String phonenum, String address) {

        try {
            String sql = "UPDATE Account SET email = ?, password = ?, fullname = ?, phonenum = ?, address = ? WHERE accountID = ?";
            stm = connection.prepareStatement(sql);

            // Đặt các giá trị cho câu lệnh SQL
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, fullname);
            stm.setString(4, phonenum);
            stm.setString(5, address);
            stm.setInt(6, accountID);

            // Thực thi câu lệnh SQL
            int rowsUpdated = stm.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Thông tin profile đã được cập nhật thành công.");
            } else {
                System.out.println("Không tìm thấy tài khoản để cập nhật.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Account checkLogin(String email, String password) {

        try {
            String sql = "SELECT accountID, email, password, roleID, fullname,phonenum, address, status \n"
                    + "FROM [dbo].[account] \n"
                    + "WHERE [email] = ? and [password] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();

                a.setEmail(email);
                a.setPassword(password);
                a.setAccountID(rs.getInt(1));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getNString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setStatus(rs.getBoolean(8));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void checkSignup(String email, String password, String fullname, String phone, String address) {

        try {
            String sql = "INSERT INTO [dbo].[account]([email],[password],[roleID],"
                    + "[fullname],[phonenum],[address],[status])\n"
                    + "VALUES(?,?,1,?,?,?,1)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, fullname);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addNewAcc(String email, String password, int roleID, String fullname, String phone, String address, boolean status) {

        try {
            String sql = "INSERT INTO [dbo].[account]([email],[password],[roleID],"
                    + "[fullname],[phonenum],[address],[status])\n"
                    + "VALUES(?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setInt(3, roleID);
            stm.setString(4, fullname);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.setBoolean(7, status);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Account checkLoginAdmin(String email, String password) {

        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '2'";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();

                a.setEmail(email);
                a.setPassword(password);
                a.setAccountID(rs.getInt(1));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getNString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setStatus(rs.getBoolean(7));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkLoginSale(String email, String password) {

        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '3'";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setEmail(email);
                a.setPassword(password);
                a.setAccountID(rs.getInt(1));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getNString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setStatus(rs.getBoolean(7));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkLoginMKT(String email, String password) {

        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '4'";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();

                a.setEmail(email);
                a.setPassword(password);
                a.setAccountID(rs.getInt(1));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getNString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setStatus(rs.getBoolean(7));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountExsit(String email) {

        try {
            String sql = "select * from Account where email = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountByEmail(String email) {

        try {
            String sql = "select * from Account where email = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setEmail(rs.getString("email"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUserPass(String email, String pass) {
        String sql = "UPDATE Account\n"
                + "SET [password] = '" + pass + "'\n"
                + "WHERE [email] = '" + email + "'";
        try {
            stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
        }
    }

    public void updateUserStatus(int accountID, boolean status) {
        String sql = "UPDATE Account\n"
                + "SET [status] = ?\n"
                + "WHERE [accountID] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(2, accountID);
            stm.setBoolean(1, status);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {

        try {
            String sql = "select * from account where accountID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountID(id);
                a.setEmail(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setAddress(rs.getString(7));
                a.setStatus(rs.getBoolean(8));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;

    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> acc = new ArrayList<>();
        try {
            String sql = "SELECT a.accountID, a.fullname, a.email, a.roleID, "
                    + "a.address, a.phonenum, a.status, r.roleName\n"
                    + "FROM Account a\n"
                    + "inner join role r\n"
                    + "on a.roleID = r.roleID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account ac = new Account();
                ac.setAccountID(rs.getInt("accountID"));
                ac.setEmail(rs.getString("email"));
                Role rl = new Role();
                rl.setRoleID(rs.getInt("roleID"));
                rl.setRoleName(rs.getString("roleName"));
                ac.setRole(rl);
                ac.setFullName(rs.getString("fullName"));
                ac.setPhoneNumber(rs.getString("phonenum"));
                ac.setAddress(rs.getString("address"));
                ac.setStatus(rs.getBoolean("status"));
                acc.add(ac);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return acc;

    }

    public ArrayList<Role> getRoleManage() {
        ArrayList<Role> role = new ArrayList<>();
        try {
            String sql = "SELECT roleID, roleName\n"
                    + "FROM role\n"
                    + "WHERE roleID IN (2, 3, 4);";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {              
                Role rl = new Role();
                rl.setRoleID(rs.getInt("roleID"));
                rl.setRoleName(rs.getString("roleName"));
                role.add(rl);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return role;

    }

    @Override
    public ArrayList<Account> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Account> editAccount(String account) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Account> getListCustomer() {
        ArrayList<Account> accList = new ArrayList<>();

        try {
            String sql = "SELECT a.accountID, a.email, a.password, a.roleID, a.fullname, a.phonenum, a.address, a.status, r.roleName FROM Account a "
                    + "INNER JOIN Role r ON a.roleID = r.roleID WHERE a.roleID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, 1); // Loc theo roleID = 1
            rs = stm.executeQuery();

            while (rs.next()) {
                Account acc = new Account();
                acc.setAccountID(rs.getInt("accountID"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));

                Role rl = new Role();
                rl.setRoleID(rs.getInt("roleID"));
                rl.setRoleName(rs.getString("roleName"));

                acc.setRole(rl);
                acc.setFullName(rs.getString("fullName"));
                acc.setAddress(rs.getString("address"));
                acc.setStatus(rs.getBoolean("status"));
                accList.add(acc);
            }
            System.out.println("Get all accounts success");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return accList;
    }
    public boolean changePassword(String email, String password, String newPass) {
        PreparedStatement stm = null;

        try {
            String sql = "UPDATE Account SET password = ? WHERE email = ? AND password = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, newPass);
            stm.setString(2, email);
            stm.setString(3, password);

            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Password changed successfully");
                return true;
            } else {
                System.out.println("Failed to change password");
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return false;
    }
    public int getRoleID(String email) {
        int roleID = -1; // Default value if roleID is not found

        String sql = "SELECT [roleID] FROM [dbo].[account] WHERE [email] = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    roleID = resultSet.getInt("roleID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roleID;
    }
    public void resetPassword(String email, String password) {
        String sql = "update Account\n"
                + "set password = ? \n"
                + "where email = ?";
        PreparedStatement stm;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, email);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

    }
    public boolean checkPassword(String email, String password) {
    try {
        String sql = "SELECT password FROM account WHERE email = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            String storedPassword = rs.getString("password");
            
            // So sánh mật khẩu
            if (storedPassword.equals(password)) {
                return true; // Mật khẩu chính xác
            }
        }
        
        // Mật khẩu không chính xác hoặc không tìm thấy tài khoản
        return false;
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }
}

}
