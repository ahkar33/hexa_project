package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.UserRequestDto;
import com.ace.hexa.dto.UserResponseDto;

@Service
public class UserDao {

	public static Connection con = null;
	static {
		try {
			con = JdbcConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean check(String email, String password) {

		String sql = "select * from user_account where user_email=? && user_password=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public boolean checkByEmail(String email) {

		String sql = "select * from user_account where user_email=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public UserResponseDto selectById(long userId) {
		String sql = "select * from user_account where user_id=?";
		UserResponseDto res = new UserResponseDto();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setUser_id(rs.getLong("user_id"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_role(rs.getInt("user_role"));
				res.setUser_email(rs.getString("user_email"));
				res.setUser_password(rs.getString("user_password"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public UserResponseDto selectByEmail(String user_email) {
		String sql = "select * from user_account where user_email=?";
		UserResponseDto res = new UserResponseDto();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setUser_id(rs.getLong("user_id"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_role(rs.getInt("user_role"));
				res.setUser_email(rs.getString("user_email"));
				res.setUser_password(rs.getString("user_password"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public int insertUser(UserRequestDto dto) {
		String sql = "insert into user_account (user_name, user_role, user_email, user_password) values(?, ?, ?, ?)";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_name());
			ps.setInt(2, 3);
			ps.setString(3, dto.getUser_email());
			ps.setString(4, dto.getUser_password());
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

}
