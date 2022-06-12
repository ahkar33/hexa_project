package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.user.UserRequestDto;
import com.ace.hexa.dto.user.UserResponseDto;
import com.ace.hexa.dto.user.UserRoleResponseDto;

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
		String sql = "select * from user_account where binary user_email=? && binary user_password=?";
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
				res.setUser_status(rs.getInt("user_status"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public UserResponseDto selectByEmail(String user_email) {
		String sql = "select * from user_account join user_role on user_account.user_role = user_role.user_role_id where user_email=?";
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
				res.setUser_role_name(rs.getString("user_role_name"));
				res.setUser_status(rs.getInt("user_status"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public ArrayList<UserResponseDto> selectAllUsers() {
		ArrayList<UserResponseDto> list = new ArrayList<>();
		String sql = "select user_account.user_id, user_account.user_name, user_account.user_email, user_account.user_status, user_role.user_role_name from user_account join user_role on user_account.user_role = user_role.user_role_id where user_role = 3 order by user_account.user_id";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserResponseDto res = new UserResponseDto();
				res.setUser_id(rs.getLong("user_id"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_email(rs.getNString("user_email"));
				res.setUser_role_name(rs.getString("user_role_name"));
				res.setUser_status(rs.getInt("user_status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public ArrayList<UserResponseDto> selectAllExceptAdmins() {
		ArrayList<UserResponseDto> list = new ArrayList<>();
		String sql = "select user_account.user_id, user_account.user_name, user_account.user_email, user_account.user_status, user_role.user_role_name from user_account join user_role on user_account.user_role = user_role.user_role_id where user_account.user_role <> 1 order by user_account.user_id";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserResponseDto res = new UserResponseDto();
				res.setUser_id(rs.getLong("user_id"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_email(rs.getNString("user_email"));
				res.setUser_role_name(rs.getString("user_role_name"));
				res.setUser_status(rs.getInt("user_status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public int insertUser(UserRequestDto dto) {
		String sql = "insert into user_account (user_name, user_role, user_email, user_password, user_status) values(?, ?, ?, ?, ?)";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_name());
			ps.setInt(2, 3);
			ps.setString(3, dto.getUser_email());
			ps.setString(4, dto.getUser_password());
			ps.setInt(5, 0);
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public int updateUserStatusById(int user_status, long user_id) {
		String sql = "update user_account set user_status = ? where user_id = ?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, user_status);
			ps.setLong(2, user_id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public ArrayList<UserRoleResponseDto> selectAllRole() {
		ArrayList<UserRoleResponseDto> list = new ArrayList<>();
		String sql = "SELECT * FROM user_role;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserRoleResponseDto res = new UserRoleResponseDto();
				res.setId(rs.getInt("user_role_id"));
				res.setName(rs.getString("user_role_name"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int updateUserRoleById(int user_role, long user_id) {
		String sql = "update user_account set user_role = ? where user_id = ?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, user_role);
			ps.setLong(2, user_id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public long getReportersCount() {
		String sql = "select count(user_id) as repoters from user_account where user_role= 2";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("repoters");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public long getUsersCount() {
		String sql = "select count(user_id) as users from user_account";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("users");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}
}
