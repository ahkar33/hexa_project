package com.ace.hexa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ace.hexa.dto.category.CategoryRequestDto;
import com.ace.hexa.dto.category.CategoryResponseDto;
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

	public ArrayList<NewsResponseDto> selectLatestNews() {
		ArrayList<NewsResponseDto> list = new ArrayList<>();
		String sql = "select * from news_project.news JOIN user_account on news.creator_id = user_account.user_id JOIN news_category on news.news_category = news_category.news_category_id order by news_id desc limit 4";
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

	public String selectNewsNameByNewsId(long news_id) {
		String sql = "select news_name from news where news_id = ?";
		String res = null;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, news_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getString("news_name");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public ArrayList<NewsResponseDto> selectNewsByCreatorId(long id) {
		ArrayList<NewsResponseDto> list = new ArrayList<>();
		String sql = "select * from news_project.news JOIN user_account on news.creator_id = user_account.user_id JOIN news_category on news.news_category = news_category.news_category_id where news.creator_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
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

	public int deleteCategory(long id) {
		int result = 0;
		String sql = "DELETE FROM `news_project`.`news_category` WHERE (`news_category_id` = ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database Error!!!");
		}
		return result;
	}

	public ArrayList<NewsResponseDto> selectNewsByCategoryId(long id) {
		ArrayList<NewsResponseDto> list = new ArrayList<>();
		String sql = "select * from news where news_category=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsResponseDto res = new NewsResponseDto();
				res.setNews_id(rs.getLong("news_id"));
				res.setNews_name(rs.getString("news_name"));
				res.setDescriptions(rs.getString("descriptions"));
				res.setNews_img(rs.getString("news_img"));
				res.setNews_location(rs.getString("news_location"));
				res.setNews_category(rs.getInt("news_category"));
				res.setCreated_date(rs.getDate("created_date").toLocalDate());
				res.setUpdated_date(rs.getDate("updated_date").toLocalDate());
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public long getNewsCount() {
		String sql = "select count(news_id) as news from news";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("news");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public long getNewsCountByCatId(long id) {
		String sql = "select count(news_id) as news from news where news_category=?";
		long res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getInt("news");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public int updateNewsWithoutImg(NewsRequestDto dto) {
		int result = 0;
		String sql = "update news set news_name=?,news_category=?,news_location=?,descriptions=? where news_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNews_name());
			ps.setLong(2, dto.getNews_category());
			ps.setString(3, dto.getNews_location());
			ps.setString(4, dto.getDescriptions());
			ps.setLong(5, dto.getNews_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}

	public int updateNews(NewsRequestDto dto) {
		int result = 0;
		String sql = "update news set news_name=?,news_category=?,news_location=?,descriptions=?,news_img=? where news_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNews_name());
			ps.setLong(2, dto.getNews_category());
			ps.setString(3, dto.getNews_location());
			ps.setString(4, dto.getDescriptions());
			ps.setString(5, dto.getNews_img());
			ps.setLong(6, dto.getNews_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}

	public int deleteNews(Long news_id) {
		int result = 0;
		String sql = "delete from news where news_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, news_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}

	public ArrayList<NewsResponseDto> selectNewsByWords(String words) {
		ArrayList<NewsResponseDto> list = new ArrayList<>();
		String sql = "select * from news where news_name like ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + words + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsResponseDto res = new NewsResponseDto();
				res.setNews_id(rs.getLong("news_id"));
				res.setNews_name(rs.getString("news_name"));
				res.setDescriptions(rs.getString("descriptions"));
				res.setNews_img(rs.getString("news_img"));
				res.setNews_location(rs.getString("news_location"));
				res.setNews_category(rs.getInt("news_category"));
				res.setCreated_date(rs.getDate("created_date").toLocalDate());
				res.setUpdated_date(rs.getDate("updated_date").toLocalDate());
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}
