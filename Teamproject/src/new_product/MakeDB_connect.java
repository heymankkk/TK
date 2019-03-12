package new_product;                  // new
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MakeDB_connect{
	public static MakeDB_connect DB = new MakeDB_connect();
	public static MakeDB_connect getDB() {
		return DB;
	}
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	public void autoWrite(int n) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		MakeDB_data data=new MakeDB_data();
		for(int i=0; i<n; i++) {
			data.setItemname("");
			data.setItemprice(0);
			data.setSelno(0);
			data.setCategory1("");
			data.setCategory2("");
			data.setItemoption1(0);
			data.setItemoption2(0);
			data.setImage("");
			try {
				conn=getConnection();
				String sql="insert into item_test values(0,?,?,sysdate(),?,?,?,?,?,?,?,'')";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, data.getItemname());
				pstmt.setLong(2, data.getItemprice());
				pstmt.setInt(3, data.getSelno());
				pstmt.setString(4, data.getItemcontent());
				pstmt.setString(5, data.getCategory1());
				pstmt.setString(6, data.getCategory2());
				pstmt.setInt(7, data.getItemoption1());
				pstmt.setInt(8, data.getItemoption2());
				pstmt.setString(9, data.getImage()+".jpg");
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pstmt.close(); conn.close();
			}
		}
	}
	public List<SelectDB_data> list(String order, int startRow, int listSize, String where) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SelectDB_data> list = new ArrayList<SelectDB_data>();
		SelectDB_data list0 = null;
		
		try {
			conn=getConnection();
			String sql="select * from item_test "+where+" order by "+order+" limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list0=new SelectDB_data();
				list0.setItemno(rs.getInt("itemno"));
				list0.setItemname(rs.getString("itemname"));
				list0.setItemprice(rs.getInt("itemprice"));
				list0.setCategory2(rs.getString("category2"));
				list0.setItemoption1(rs.getInt("itemoption1"));
				list0.setItemoption2(rs.getInt("itemoption2"));
				list0.setImage(rs.getString("image"));
				list.add(list0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//pstmt.close(); conn.close();
		}
		return list;
	}
	
	public int count() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConnection();
			String sql="select count(*) as count from item_test";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return count;
	}
	
	public SelectDB_data view_product(String itemno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		SelectDB_data list0 = new SelectDB_data();
		try {
			conn=getConnection();
			String sql="select * from item_test where itemno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, itemno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list0.setItemno(rs.getInt("itemno"));
				list0.setItemname(rs.getString("itemname"));
				list0.setItemprice(rs.getLong("itemprice"));
				list0.setSelno(rs.getInt("selno"));
				list0.setItemcontent(rs.getString("itemcontent"));
				list0.setCategory1(rs.getString("category1"));
				list0.setCategory2(rs.getString("category2"));
				list0.setItemoption1(rs.getInt("itemoption1"));
				list0.setItemoption2(rs.getInt("itemoption2"));
				list0.setImage(rs.getString("image"));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return list0;
	}
}
