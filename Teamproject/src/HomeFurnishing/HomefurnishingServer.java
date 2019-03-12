package HomeFurnishing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HomefurnishingServer {
	private static HomefurnishingServer HFS = new HomefurnishingServer();

	public static HomefurnishingServer getHomefurnishingServer() {
		return HFS;
	}
	private HomefurnishingServer() {
	
	}	
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public List<HomefurnishingData> selecthome(String test) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HomefurnishingData> homelist=null;
		String sql;
		try {
			conn=getConnection();
			if(!test.equals("전체보기")) {
				sql = "select * from homefurnishing where homehashtag=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, test);
				
			}
			if(test.equals("전체보기")){
				sql = "select * from homefurnishing";
				pstmt = conn.prepareStatement(sql);
			}
			rs=pstmt.executeQuery();
			homelist = new ArrayList<HomefurnishingData>();
			
			while(rs.next()){
				HomefurnishingData hfd = new HomefurnishingData();

				hfd.setHomeno(rs.getInt("homeno")); 
				hfd.setHomeimg(rs.getString("homeimg"));
				hfd.setHomewriter(rs.getString("homewriter"));
				hfd.setHomelike(rs.getInt("homelike"));
				hfd.setHometitle(rs.getString("hometitle"));
				hfd.setHomecontent(rs.getString("homecontent"));
				hfd.setHomedate(rs.getString("homedate"));
				hfd.setHomehashtag(rs.getString("homehashtag"));
				
				homelist.add(hfd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				rs.close();
				pstmt.close();
				conn.close();
		}
		return homelist;
	}
	
	public HomefurnishingData selecthomeview(int number) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HomefurnishingData viewlist =null;
		
		try {
			conn=getConnection();
			String sql = "select * from homefurnishing where homeno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				viewlist= new HomefurnishingData();

				viewlist.setHomeno(rs.getInt("homeno")); 
				viewlist.setHomeimg(rs.getString("homeimg"));
				viewlist.setHomewriter(rs.getString("homewriter"));
				viewlist.setHomelike(rs.getInt("homelike"));
				viewlist.setHometitle(rs.getString("hometitle"));
				viewlist.setHomecontent(rs.getString("homecontent"));
				viewlist.setHomedate(rs.getString("homedate"));
				viewlist.setHomehashtag(rs.getString("homehashtag"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				rs.close();
				pstmt.close();
				conn.close();
		}
		return viewlist;
	}
	
	public String viewbackno(int number, String filter) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int backno = 0;
		try {
			conn=getConnection();
			String sql = null;
			if(filter.equals("전체보기")) {
				sql = "select homeno from homefurnishing where homeno=(select max(homeno) from homefurnishing where homeno < ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  number);
			}
			else if(!filter.equals("전체보기")) {
				sql = "select homeno from homefurnishing where homeno=(select max(homeno) from homefurnishing where homeno < ? and homehashtag=?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  number);
				pstmt.setString(2, filter);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				backno = rs.getInt("homeno");
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return Integer.toString(backno);
	}
	
	public String viewnextno(int number, String filter) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int nextno = 0;
		try {
			conn=getConnection();
			String sql = null;
			if(filter.equals("전체보기")) {
				sql = "select homeno from homefurnishing where homeno=(select min(homeno) from homefurnishing where homeno > ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  number);
			}
			else if(!filter.equals("전체보기")) {
				sql = "select homeno from homefurnishing where homeno=(select min(homeno) from homefurnishing where homeno > ? and homehashtag=?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  number);
				pstmt.setString(2, filter);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nextno = rs.getInt("homeno");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return Integer.toString(nextno);
	}
	
	public void insertData(HomefurnishingData HFD) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			conn=getConnection();
			sql = "insert into homefurnishing(homeimg, homewriter, homelike, hometitle, homecontent, homedate, homehashtag)values(?, ?, 0, ?, ?, sysdate(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HFD.getHomeimg());
			pstmt.setString(2, HFD.getHomewriter());
			pstmt.setString(3, HFD.getHometitle());
			pstmt.setString(4, HFD.getHomecontent());
			pstmt.setString(5, HFD.getHomehashtag());
			
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
			conn.close();
		}
	}
}
