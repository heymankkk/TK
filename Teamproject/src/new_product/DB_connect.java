package new_product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Crawler.IKEAVO;

public class DB_connect {
	public static DB_connect DB = new DB_connect();
	public static DB_connect getDB() {
		return DB;
	}
	private Connection getConnection() throws Exception{ 
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	public DB_data view(String itemno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DB_data data = new DB_data();
		try {
			conn=getConnection();
			String sql="select * from item where itemno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, itemno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				data.setSelno(rs.getInt("selno"));
				data.setItemno(rs.getInt("itemno"));
				data.setItemname(rs.getString("itemname"));
				data.setItemprice(rs.getLong("itemprice"));
				data.setItemcontent(rs.getString("itemcontent"));
				data.setScore(rs.getInt("score"));
				data.setImage1(rs.getString("image1"));	data.setImage2(rs.getString("image2"));
				data.setImage3(rs.getString("image3"));	data.setImage4(rs.getString("image4"));
				data.setImage5(rs.getString("image5"));
				data.setCategory1(rs.getString("category1"));	data.setCategory2(rs.getString("category2"));
				data.setItemshape1(rs.getString("itemshape1"));	data.setItemshape2(rs.getString("itemshape2"));
				data.setItemshape3(rs.getString("itemshape3"));	data.setItemshape4(rs.getString("itemshape4"));
				data.setItemshape5(rs.getString("itemshape5"));	data.setItemshape6(rs.getString("itemshape6"));
				data.setItemshape7(rs.getString("itemshape7"));	data.setItemshape8(rs.getString("itemshape8"));
				data.setItemshape9(rs.getString("itemshape9"));	data.setItemshape10(rs.getString("itemshape10"));
				data.setItemsize1(rs.getString("itemsize1"));	data.setItemsize2(rs.getString("itemsize2"));
				data.setItemsize3(rs.getString("itemsize3"));	data.setItemsize4(rs.getString("itemsize4"));
				data.setItemsize5(rs.getString("itemsize5"));	data.setItemsize6(rs.getString("itemsize6"));
				data.setItemsize7(rs.getString("itemsize7"));	data.setItemsize8(rs.getString("itemsize8"));
				data.setItemsize9(rs.getString("itemsize9"));	data.setItemsize10(rs.getString("itemsize10"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return data;
	}
	
	public List<DB_data> list(String order, int startRow, int listSize, String where) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DB_data> list = new ArrayList<DB_data>();
		DB_data list0 = null;
		
		try {
			conn=getConnection();
			String sql="select * from item "+where+" order by "+order+" limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list0=new DB_data();
				list0.setItemno(rs.getInt("itemno"));
				list0.setItemname(rs.getString("itemname"));
				list0.setItemprice(rs.getInt("itemprice"));
				list0.setCategory1(rs.getString("category1"));
				list0.setCategory2(rs.getString("category2"));
				list0.setImage1(rs.getString("image1"));
				list.add(list0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return list;
	}
	
	public List<DB_data> eachlist(String order, int startRow, int listSize, String where) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DB_data> list = new ArrayList<DB_data>();
		DB_data list0 = null;
		
		try {
			conn=getConnection();
			String sql="select * from item "+where+" order by "+order+" limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list0=new DB_data();
				list0.setItemno(rs.getInt("itemno"));
				list0.setItemname(rs.getString("itemname"));
				list0.setItemprice(rs.getInt("itemprice"));
				list0.setCategory1(rs.getString("category1"));
				list0.setCategory2(rs.getString("category2"));
				list0.setImage1(rs.getString("image1"));
				list.add(list0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return list;
	}
	
	public void write(DB_data data) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			String sql="insert into item values(0,?,?,sysdate(),?,?,0,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, data.getItemname());
			pstmt.setLong(2, data.getItemprice());
			pstmt.setInt(3, data.getSelno());
			pstmt.setString(4, data.getItemcontent());
			pstmt.setString(5, data.getCategory1());
			pstmt.setString(6, data.getCategory2());
			pstmt.setString(7, data.getImage1());
			pstmt.setString(8, data.getImage2());
			pstmt.setString(9, data.getImage3());
			pstmt.setString(10, data.getImage4());
			pstmt.setString(11, data.getImage5());
			
			pstmt.setString(12, data.getItemshape1());
			pstmt.setString(13, data.getItemshape2());
			pstmt.setString(14, data.getItemshape3());
			pstmt.setString(15, data.getItemshape4());
			pstmt.setString(16, data.getItemshape5());
			pstmt.setString(17, data.getItemshape6());
			pstmt.setString(18, data.getItemshape7());
			pstmt.setString(19, data.getItemshape8());
			pstmt.setString(20, data.getItemshape9());
			pstmt.setString(21, data.getItemshape10());
			
			pstmt.setString(22, data.getItemsize1());
			pstmt.setString(23, data.getItemsize2());
			pstmt.setString(24, data.getItemsize3());
			pstmt.setString(25, data.getItemsize4());
			pstmt.setString(26, data.getItemsize5());
			pstmt.setString(27, data.getItemsize6());
			pstmt.setString(28, data.getItemsize7());
			pstmt.setString(29, data.getItemsize8());
			pstmt.setString(30, data.getItemsize9());
			pstmt.setString(31, data.getItemsize10());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
	}
	
	public int count() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConnection();
			String sql="select count(*) as count from item";
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
	
	public void addwish(int custno, int count, int itemno, String shape, String size, int price, int selno){
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="insert into wish values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			pstmt.setInt(2,	itemno);
			pstmt.setInt(3, count);
			pstmt.setString(4, shape);
			pstmt.setString(5, size);
			pstmt.setInt(6, price);
			pstmt.setInt(7, selno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<wish_data> viewwish(String custno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<wish_data> data  = new ArrayList<wish_data>();
		wish_data list=null;
		try {
			conn=getConnection();
			String sql="select * from wish join item on wish.itemno=item.itemno where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list = new wish_data();
				list.setCount(rs.getInt("count"));
				list.setCustno(rs.getInt("custno"));
				list.setItemno(rs.getInt("itemno"));
				list.setShape(rs.getString("shape"));
				list.setSize(rs.getString("size"));
				list.setImage(rs.getString("image1"));
				list.setItemname(rs.getString("itemname"));
				list.setCate(rs.getString("category1")+" - "+rs.getString("category2"));
				list.setItemprice(rs.getLong("itemprice"));
				list.setSelno(rs.getInt("selno"));
				data.add(list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return data;
	}
	public void delwish(int custno, int count, int itemno, String shape, String size){
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="delete from wish where custno=? and itemno=? and count=? and shape=? and size=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			pstmt.setInt(2,	itemno);
			pstmt.setInt(3, count);
			pstmt.setString(4, shape);
			pstmt.setString(5, size);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void updwish(int custno, int count, int itemno, String shape, String size){
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="update wish set count=? where custno=? and itemno=? and shape=? and size=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, custno);
			pstmt.setInt(3,	itemno);
			pstmt.setString(4, shape);
			pstmt.setString(5, size);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public cust_data pay_list(int custno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		cust_data data = new cust_data();
		try {
			conn=getConnection();
			String sql="select * from cust where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				data.setId(rs.getString("id"));
				data.setEmail(rs.getString("email"));
				data.setName(rs.getString("name"));
				data.setPhone(rs.getString("phone"));
				data.setAdd_full(rs.getString("add_full"));
				data.setAdd_jibun(rs.getString("add_jibun"));
				data.setAdd_no(rs.getString("add_no"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
		return data;
	}
	
	public void addorderT(orderT_data t_data) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="insert into orderT values(0,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, t_data.getSelno());
			pstmt.setInt(2,	t_data.getTotalprice());
			pstmt.setString(3, t_data.getRcvemail());
			pstmt.setString(4, t_data.getRcvphone());
			pstmt.setString(5, t_data.getRcvname());
			pstmt.setString(6, t_data.getRcvaddress());
			pstmt.setInt(7, t_data.getCustno());
			pstmt.setInt(8, t_data.getCartcustno());
			pstmt.setString(9, t_data.getMessage());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addorderE(ArrayList<orderE_data> e_data) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		for(int i=0; i<e_data.size(); i++) {
			try {
				conn=getConnection();
				String sql="insert into orderE values(?,?,?,?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, e_data.get(i).getOrderno());
				pstmt.setInt(2,	e_data.get(i).getSelno());
				pstmt.setInt(3, e_data.get(i).getItemno());
				pstmt.setString(4, e_data.get(i).getItemname());
				pstmt.setString(5, e_data.get(i).getItemshape());
				pstmt.setString(6, e_data.get(i).getItemsize());
				pstmt.setInt(7, e_data.get(i).getHowmany());
				pstmt.setInt(8, e_data.get(i).getEachprice());
				pstmt.setString(9, e_data.get(i).getRcvaddress());
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {

			}
		}
	}
	
	public int ordercount() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConnection();
			String sql="select count(*) as count from orderT";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int cartordercount() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConnection();
			String sql="select count(*) as count from orderT where cartcustno!=''";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void endwish(String custno) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="delete from wish where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String rouletteHistory(String custno) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String today="";
		try {
			conn=getConnection();
			String sql="select roulette from cust where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				today=rs.getString("roulette");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return today;
	}
	
	public void roulette(String custno, String event, int part, String today, String month) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String content="";
		try {
			conn=getConnection();
			String sql="select roulette from cust where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("roulette")!=null) {
					content=rs.getString("roulette");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		
		try {
			conn=getConnection();
			String sql="update cust set roulette=? where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			content+=part+","+month+","+today+",";
			pstmt.setString(1, content);
	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
	}
	
	public void roulette_coupon(String custno, String event) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String content="";
		try {
			conn=getConnection();
			String sql="select coupon from cust where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("coupon")!=null) {
					content=rs.getString("coupon");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		
		try {
			conn=getConnection();
			String sql="update cust set coupon=? where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			content+=event+",";
			pstmt.setString(1, content);
	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
	}
	
	public void roulette_point(String custno, String event) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int content=0;
		try {
			conn=getConnection();
			String sql="select point from cust where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("point")!=null) {
					content=rs.getInt("point");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		
		try {
			conn=getConnection();
			String sql="update cust set point=? where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			content+=Integer.parseInt(event);
			pstmt.setInt(1, content);
	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
	}
	
	public List<orderT_data> orderpageT(int custno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<orderT_data> data= new ArrayList<orderT_data>();
		orderT_data tt = null;
		try {
			conn=getConnection();
			String sql="select * from orderT where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				tt=new orderT_data();
				tt.setSelno(rs.getString("selno"));
				tt.setRcvemail(rs.getString("rcvemail"));
				tt.setRcvname(rs.getString("rcvname"));
				tt.setRcvphone(rs.getString("rcvphone"));
				tt.setRcvaddress(rs.getString("rcvaddress"));
				tt.setMessage(rs.getString("massage"));
				tt.setOrderno(rs.getInt("orderno"));
				tt.setCustno(rs.getInt("custno"));
				tt.setTotalprice(rs.getInt("totalprice"));
				tt.setCartcustno(rs.getInt("cartcustno"));
				data.add(tt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return data;
	}
	
	public List<orderE_data> orderpageE(int orderno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<orderE_data> data= new ArrayList<orderE_data>();
		orderE_data tt = null;
		try {
			conn=getConnection();
			String sql="select * from orderE where orderno="+orderno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				tt=new orderE_data();
				tt.setItemname(rs.getString("itemname"));
				tt.setItemshape(rs.getString("itemshape"));
				tt.setItemsize(rs.getString("itemsize"));
				tt.setOrderno(rs.getInt("orderno"));
				tt.setSelno(rs.getInt("selno"));
				tt.setItemno(rs.getInt("itemno"));
				tt.setEachprice(rs.getInt("eachprice"));
				tt.setHowmany(rs.getInt("howmany"));
				data.add(tt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return data;
	}
	
	public String getimage(int itemno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String img="";
		try {
			conn=getConnection();
			String sql="select image1 from item where itemno="+itemno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				img=rs.getString("image1");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return img;
	}
	
	public int getselno(String custno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int selno=0;
		try {
			conn=getConnection();
			String sql="select selno from cust where custno="+custno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				selno=rs.getInt("selno");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return selno;
		
	}
	
	public List<orderE_data> getsellist(int selno) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<orderE_data> abcd = new ArrayList<orderE_data>();
		orderE_data data = null;
		try {
			conn=getConnection();
			String sql="select * from orderE where selno="+selno;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				data = new orderE_data();
				data.setOrderno(rs.getInt("orderno"));
				data.setSelno(rs.getInt("selno"));
				data.setItemno(rs.getInt("itemno"));
				data.setEachprice(rs.getInt("eachprice"));
				data.setRcvaddress(rs.getString("rcvaddress"));
				data.setHowmany(rs.getInt("howmany"));
				data.setItemname(rs.getString("itemname"));
				data.setItemshape(rs.getString("itemshape"));
				data.setItemsize(rs.getString("itemsize"));
				
				abcd.add(data);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return abcd;
	}
	
	public void setScore(String itemno, int avg) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="update item set score="+avg+" where itemno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, itemno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
	}
	
	public String getcoupon(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String coupon="";
		try {
			conn=getConnection();
			String sql="select coupon from cust where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("coupon")!=null) {
					coupon=rs.getString("coupon");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return coupon;
	}
	public int getpoint(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int point=0;
		try {
			conn=getConnection();
			String sql="select point from cust where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				point=rs.getInt("point");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(); pstmt.close();
		}
		return point;
	}
	
	
	
	
	
	
	
	
	public void write_crawler(IKEAVO data) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			String sql="insert into item values(0,?,?,sysdate(),?,?,0,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, data.getItemname());
			pstmt.setLong(2, data.getItemprice());
			pstmt.setInt(3, data.getSelno());
			pstmt.setString(4, data.getItemcontent());
			pstmt.setString(5, data.getCategory1());
			pstmt.setString(6, data.getCategory2());
			pstmt.setString(7, data.getImage1());
			pstmt.setString(8, data.getImage1());	//향후 수정
			pstmt.setString(9, data.getImage1());	//향후 수정
			pstmt.setString(10, data.getImage1());	//향후 수정
			pstmt.setString(11, data.getImage1());	//향후 수정
			
			pstmt.setString(12, data.getItemshape()[0]);
			pstmt.setString(13, data.getItemshape()[1]);
			pstmt.setString(14, data.getItemshape()[2]);
			pstmt.setString(15, data.getItemshape()[3]);
			pstmt.setString(16, data.getItemshape()[4]);
			pstmt.setString(17, data.getItemshape()[5]);
			pstmt.setString(18, data.getItemshape()[6]);
			pstmt.setString(19, data.getItemshape()[7]);
			pstmt.setString(20, data.getItemshape()[8]);
			pstmt.setString(21, data.getItemshape()[9]);
			
			pstmt.setString(22, data.getItemsize()[0]);
			pstmt.setString(23, data.getItemsize()[1]);
			pstmt.setString(24, data.getItemsize()[2]);
			pstmt.setString(25, data.getItemsize()[3]);
			pstmt.setString(26, data.getItemsize()[4]);
			pstmt.setString(27, data.getItemsize()[5]);
			pstmt.setString(28, data.getItemsize()[6]);
			pstmt.setString(29, data.getItemsize()[7]);
			pstmt.setString(30, data.getItemsize()[8]);
			pstmt.setString(31, data.getItemsize()[9]);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close(); conn.close();
		}
	}
}
