package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDBBean {
	private static ReviewDBBean ReviewDB = new ReviewDBBean();
	
	public static ReviewDBBean getReviewDB() {
		return ReviewDB;
	}
	private ReviewDBBean() {}
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public List<ReviewDataDB> loadreview(int itemno, String choice, int startRow, int pageSize) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDataDB> reviewlist= null;
		
		try {
			conn = getConnection();
			String sql = "select * from reviewboard where itemno=? order by "+choice+" limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, itemno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			reviewlist = new ArrayList<ReviewDataDB>();
			
			while(rs.next()) {
				ReviewDataDB boardlist = new ReviewDataDB();
				boardlist.setStarscore(rs.getString("starscore"));
				boardlist.setNickname(rs.getString("nickname"));
				boardlist.setSubject(rs.getString("subject"));
				boardlist.setContent(rs.getString("content"));
				boardlist.setReg_date(rs.getString("reg_date"));
				boardlist.setItemno(rs.getInt("itemno"));
				reviewlist.add(boardlist);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
		}
		
		return reviewlist;
	}
	
	public void insertreview(ReviewDataDB rb) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ReviewDataDB> reviewlist= null;
		
		try {
			conn = getConnection();
			String starscore = rb.getStarscore();
			String nickname = rb.getNickname();
			String subject = rb.getSubject();
			String content = rb.getContent();
			String reg_date = rb.getReg_date();
			int itemno = rb.getItemno();
			
			String sql = "insert into reviewboard(starscore ,nickname, subject, content, reg_date, itemno)\r\n" + 
					"		values(?,?,?,?,sysdate(),?);";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "star"+starscore+".jpg");
			pstmt.setString(2, nickname);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, itemno);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
		}
	}
	
	public void insertreview12(ReviewDataDB rb) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ReviewDataDB> reviewlist= null;
		
		try {
			conn = getConnection();
			String starscore = rb.getStarscore();
			String nickname = rb.getNickname();
			String subject = rb.getSubject();
			String content = rb.getContent();
			String reg_date = rb.getReg_date();
			int itemno = rb.getItemno();
			
			String sql = "insert into reviewboard(starscore ,nickname, subject, content, reg_date, itemno)\r\n" + 
					"		values(?,?,?,?,sysdate(),?);";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, starscore);
			pstmt.setString(2, nickname);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, itemno);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
		}
	}
	
	public int reviewCount(int itemno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int c=0;
		
		try {
			conn = getConnection();
			
				String sql="select count(*) as a from reviewboard where itemno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, itemno);
				rs = pstmt.executeQuery();
			
			while(rs.next()) {
				c=rs.getInt("a");
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			conn.close();
			pstmt.close();
		}
		return c;
	}
	
	public int reviewavg(int itemno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long c=0;
		try {
			conn = getConnection();
				String sql="select avg(starscore) as a from reviewboard where itemno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, itemno);
				rs = pstmt.executeQuery();
			if(rs.next()) {
				c=rs.getInt("a");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
		}
		int avg = (int)c/1;
		return avg;
	}
}
