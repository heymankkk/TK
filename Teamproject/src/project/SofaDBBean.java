package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class SofaDBBean{
	
		private static SofaDBBean SofaDB = new SofaDBBean();
		
		public static SofaDBBean getSofaDB() {
			return SofaDB;
		}
		
		private SofaDBBean() {}
		
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			return ds.getConnection();
		}
		
		//화면 이미지DB 불러오기
		public List<SofaDataDB> loadimg(int startRow, int pageSize, String choice, int search1, int search2) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<SofaDataDB> sofalist = null;
			
			try {
				String sql;
				int test1 = search1;
				int test2 = search2;
				conn = getConnection(); //DB연결
				if(test1==0 && test2==0){
					 sql="select * from sofadb order by "+choice+" asc limit ?,?";//
					 pstmt= conn.prepareStatement(sql);
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, pageSize);
						rs = pstmt.executeQuery();
				}
				else{
					 sql="select * from sofadb where itemprice>? and itemprice<? order by itemprice asc limit ?,?";
					 pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, search1);
						pstmt.setInt(2, search2);
						pstmt.setInt(3, startRow);
						pstmt.setInt(4, pageSize);
						rs = pstmt.executeQuery();
						
						System.out.println(search1);
						System.out.println(search2);
				}
				

				sofalist = new ArrayList<SofaDataDB>();
				
				while(rs.next()) {
					
					SofaDataDB selectlist = new SofaDataDB();
					
					selectlist.setItemno(rs.getString("itemno"));
					selectlist.setItemname(rs.getString("itemname"));
					selectlist.setItemsize(rs.getString("itemsize"));
					selectlist.setItemcolor(rs.getString("itemcolor"));
					selectlist.setItemcontent(rs.getString("itemcontent"));
					selectlist.setItemprice(rs.getString("itemprice"));
					selectlist.setSelno(rs.getString("selno"));
					selectlist.setCategory(rs.getString("category"));
					selectlist.setImage(rs.getString("image"));
					selectlist.setReg_date(rs.getString("reg_date"));
					selectlist.setItemshape(rs.getString("itemshape"));
					
					sofalist.add(selectlist);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				pstmt.close();
				conn.close();
			}
			
			return sofalist;
		}
		
	public int selectCount(int search1, int search2) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		
		try {
			String sql;
			int test1 = search1;
			int test2 = search2;
			conn = getConnection();
			
			if(test1==0 && test2==0) {
				
				sql="select count(*) as a from sofadb";
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}else{
				
				sql="select count(*) as a from sofadb where itemprice>? and itemprice< ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, search1);
				pstmt.setInt(2, search2);
				rs = pstmt.executeQuery();
			}
			/*pstmt.setInt(1, search1);
			pstmt.setInt(2, search2);*/
			while(rs.next()) {
				x=rs.getInt("a");
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			conn.close();
			pstmt.close();
		}
		
		return x;
	}
	

}
