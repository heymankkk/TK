package MainContent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MainContentServer {

	private static MainContentServer MCS = new MainContentServer();

	public static MainContentServer getMainContentServer() {
		return MCS;
	}
	private MainContentServer() {
	
	}	
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public List<ItemData> selectitem() throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItemData> boardlist=null;
		
		try {
			conn=getConnection();
			String sql = "select * from item_main";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			boardlist = new ArrayList<ItemData>();
			
			while(rs.next()){
				ItemData mcd = new ItemData();

				mcd.setSelno(rs.getInt("selno")); 
				mcd.setItemno(rs.getInt("itemno"));
				mcd.setItemname(rs.getString("itemname"));
				mcd.setItemcategory(rs.getString("itemcategory"));
				mcd.setItemimg(rs.getString("itemimg"));
				mcd.setItemsize(rs.getString("itemsize"));
				mcd.setItemcolor(rs.getString("itemcolor"));
				mcd.setItemcontent(rs.getString("itemcontent"));
				mcd.setItemprice(rs.getInt("itemprice"));
				mcd.setItemdate(rs.getString("itemdate"));
				
				boardlist.add(mcd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				rs.close();
				pstmt.close();
				conn.close();
		}
		return boardlist;
	}
	
	
}
