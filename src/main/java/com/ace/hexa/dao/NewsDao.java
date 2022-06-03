package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.category.CategoryRequestDto;
import com.ace.hexa.dto.category.CategoryResponseDto;
import com.ace.hexa.dto.interaction.InteractionRequestDto;
import com.ace.hexa.dto.interaction.InteractionResponseDto;
import com.ace.hexa.dto.news.NewsRequestDto;
import com.ace.hexa.dto.news.NewsResponseDto;

@Service
public class NewsDao {

	public static Connection con = null;
	static {
		try {
			con = JdbcConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<NewsResponseDto> selectAllNews() {
		ArrayList<NewsResponseDto> list = new ArrayList<>();
		String sql = "select * from news_project.news JOIN user_account on news.creator_id = user_account.user_id JOIN news_category on news.news_category = news_category.news_category_id";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsResponseDto res = new NewsResponseDto();
				res.setNews_id(rs.getLong("news_id"));
				res.setNews_name(rs.getString("news_name"));
				res.setDescriptions(rs.getString("descriptions"));
				res.setNews_img(rs.getString("news_img"));
				res.setNews_location(rs.getString("news_location"));
				res.setNews_status(rs.getString("news_status"));
				res.setCreator_name(rs.getString("user_name"));
				res.setNews_category_name(rs.getString("news_category_name"));
				res.setCreated_date(rs.getDate("created_date").toLocalDate());
				res.setUpdated_date(rs.getDate("updated_date").toLocalDate());
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public NewsResponseDto selectNewsById(long id) {
		String sql = "select news_name, descriptions, news_location, news_img, created_date from news where news_id = ?";
		NewsResponseDto res = new NewsResponseDto();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setNews_id(id);
				res.setNews_name(rs.getString("news_name"));
				res.setDescriptions(rs.getString("descriptions"));
				res.setNews_location(rs.getString("news_location"));
				res.setNews_img(rs.getString("news_img"));
				res.setCreated_date(rs.getDate("created_date").toLocalDate());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public ArrayList<CategoryResponseDto> selectAllNewsCategory() {
		ArrayList<CategoryResponseDto> list = new ArrayList<>();
		String sql = "select * from news_category";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryResponseDto res = new CategoryResponseDto();
				res.setNews_category_id(rs.getLong("news_category_id"));
				res.setNews_category_name(rs.getString("news_category_name"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public int insertNews(NewsRequestDto dto) {
		String sql = "insert into news (news_name, descriptions, news_img, news_location, news_category, creator_id) values(?, ?, ?, ?, ?, ?)";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNews_name());
			ps.setString(2, dto.getDescriptions());
			ps.setString(3, dto.getNews_img());
			ps.setString(4, dto.getNews_location());
			ps.setLong(5, dto.getNews_category());
			ps.setLong(6, dto.getCreator_id());

			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public ArrayList<InteractionResponseDto> selectInteractionByNewsId(long id) {
		ArrayList<InteractionResponseDto> list = new ArrayList<>();
		String sql = "select interaction.news_id, interaction.user_id, interaction.comments, interaction.commented_date, user_account.user_name from interaction join user_account on interaction.user_id = user_account.user_id where interaction.news_id = ?";
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

	public int insertCategory(CategoryRequestDto dto) {
		String sql = "insert into news_category (news_category_name) values(?)";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNews_category_name());
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public boolean checkCategory(String category) {
		String sql = "select * from news_category where news_category_name = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, category);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

}
