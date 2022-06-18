package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.interaction.InteractionRequestDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;

@Service
public class InteractionDao {

	public static Connection con = null;
	static {
		try {
			con = JdbcConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<InteractionResponseDto> selectInteractionByNewsId(long id) {
		ArrayList<InteractionResponseDto> list = new ArrayList<>();
		String sql = "select interaction.news_id, interaction.user_id, interaction.comments, interaction.commented_date, interaction.comment_id, user_account.user_name from interaction join user_account on interaction.user_id = user_account.user_id where interaction.news_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InteractionResponseDto res = new InteractionResponseDto();
				res.setNews_id(rs.getLong("news_id"));
				res.setUser_id(rs.getLong("user_id"));
				res.setComments(rs.getString("comments"));
				res.setUser_name(rs.getString("user_name"));
				res.setCommented_date(rs.getDate("commented_date").toLocalDate());
				res.setComment_id(rs.getLong("comment_id"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public int insertComment(InteractionRequestDto dto) {
		String sql = "insert into interaction (news_id, user_id, comments) values(?, ?, ?)";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, dto.getNews_id());
			ps.setLong(2, dto.getUser_id());
			ps.setString(3, dto.getComments());
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}
	
	public int updateComment(InteractionRequestDto dto) {
		int result = 0;
		String sql = "UPDATE news_project.interaction SET comments = ? WHERE comment_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getComments());
			ps.setLong(2, dto.getComment_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}

	public long getUniqueUserCount(long id) {
		ArrayList<InteractionResponseDto> list = new ArrayList<>();
		String sql = "SELECT distinct user_id FROM interaction where news_id = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InteractionResponseDto res = new InteractionResponseDto();
				res.setUser_id(rs.getLong("user_id"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list.size();
	}

	public InteractionResponseDto selectInteractionById(long id) {
		InteractionResponseDto res = new InteractionResponseDto();
		String sql = "select comment_id, interaction.news_id, interaction.user_id, interaction.comments, interaction.commented_date, user_account.user_name from interaction join user_account on interaction.user_id = user_account.user_id where interaction.comment_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setComment_id(rs.getLong("comment_id"));
				res.setNews_id(rs.getLong("news_id"));
				res.setUser_id(rs.getLong("user_id"));
				res.setComments(rs.getString("comments"));
				res.setUser_name(rs.getString("user_name"));
				res.setCommented_date(rs.getDate("commented_date").toLocalDate());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public ArrayList<Long> selectCommentedNewsId() {
		ArrayList<Long> list = new ArrayList<>();
		String sql = "select distinct news_id from interaction";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getLong("news_id"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public long selectCommentCountByNewsId(long news_id) {
		String sql = "select count(comments) as total from interaction where news_id= ?";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, news_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("total");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public long selectCommentersByNewsId(long news_id) {
		String sql = "select count(distinct user_id) as users from interaction where news_id=?";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, news_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("users");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public int deleteComment(long id) {
		int result = 0;
		String sql = "DELETE FROM `news_project`.`interaction` WHERE (`comment_id` = ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database Error!!!");
		}
		return result;
	}

	public ArrayList<Long> selectCommentedNewsIdByCreatorId(long id) {
		ArrayList<Long> list = new ArrayList<>();
		String sql = "select distinct i.news_id from interaction as i inner join news as n on i.news_id = n.news_id and n.creator_id=?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getLong("news_id"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}
