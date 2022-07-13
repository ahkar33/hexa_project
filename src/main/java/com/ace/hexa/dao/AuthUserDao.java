package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.ace.hexa.model.AuthUser;

@Service
public class AuthUserDao {
    
    private static Connection con;

    static{
        try{
           con = JdbcConnection.getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public int insertAuthUser(AuthUser authUser){
        int status = 0;
        String sql = "INSERT INTO auth_users (user_email,_token,role_id) VALUES(?,?,?)";
        try{
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString( 1 , authUser.getUser_email());
            pre.setInt( 2 , authUser.get_token());
            pre.setInt( 3 , authUser.getRole_id() );

            status = pre.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }

        return status;
    }

    public AuthUser selectAuthUser(String email){
        AuthUser authUser = new AuthUser();
        String sql = "SELECT * FROM auth_users u LEFT JOIN user_role r ON u.role_id = r.user_role_id WHERE user_email = ? ORDER BY id DESC LIMIT 1";
        try{
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString( 1 , email );

            ResultSet set = pre.executeQuery();
        
            while(set.next()){
                authUser.setUser_email(set.getString("user_email"));
                authUser.set_token(set.getInt("_token"));
                authUser.setRole_id(set.getInt("role_id"));
                authUser.setUser_role(set.getString("user_role_name"));
            }

        }catch(SQLException e){
            e.printStackTrace();
        }
        return authUser;
    }

    public int deleteAuthUser(String email){
        int status = 0;
        String sql = "DELETE FROM auth_users WHERE user_email = ? ";

        try{
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString( 1 , email );

            status = pre.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
}
