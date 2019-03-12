package member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

	public class LoginDBBean {
	public static LoginDBBean ldb = new LoginDBBean();
	public static LoginDBBean getLdb() {
		return ldb;
	}	
	private LoginDBBean() {}
	//DB����
	private Connection getConnection() throws Exception{
		Context init = new InitialContext(); //import
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql"); //import
		return ds.getConnection(); 
	}
	
	public int CustSelno() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConnection();
			String sql="select count(*) as count from cust";
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
	
	public void insertCust(LoginDataBean ltb) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
	
		try {
			conn = getConnection();			
			String id = ltb.getId();
			String pw =ltb.getPw();
			String name = ltb.getName();
			String email = ltb.getEmail();
			String phone = ltb.getPhone();
			String add_full = ltb.getAdd_full();
			String add_jibun = ltb.getAdd_jibun();
			String add_no = ltb.getAdd_no();
			int agree1 = ltb.getAgree1();
			int agree2 = ltb.getAgree2();
			int agree3 = ltb.getAgree3();
			String wright = ltb.getWright();
			String roulette = ltb.getRoulette();
			int point = ltb.getPoint();
			String coupon = ltb.getCoupon();
			if(wright.equals("0")) {
				String sql="insert into cust(id, pw, name, email, phone, add_full, add_jibun, add_no,agree1,agree2,agree3, wright, roulette, point, coupon) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
				pstmt = conn.prepareStatement(sql);		
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, phone);
				pstmt.setString(6, add_full);
				pstmt.setString(7, add_jibun);
				pstmt.setString(8, add_no);
				pstmt.setInt(9, agree1);
				pstmt.setInt(10, agree2);
				pstmt.setInt(11, agree3);
				pstmt.setString(12, wright);
				pstmt.setString(13, roulette);
				pstmt.setInt(14, point);
				pstmt.setString(15, coupon);
				pstmt.executeUpdate();
			}else {
				String sql="insert into cust(id, pw, name, email, phone, add_full, add_jibun, add_no,agree1,agree2,agree3, wright, roulette, point, coupon, selno) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
				pstmt = conn.prepareStatement(sql);		
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, phone);
				pstmt.setString(6, add_full);
				pstmt.setString(7, add_jibun);
				pstmt.setString(8, add_no);
				pstmt.setInt(9, agree1);
				pstmt.setInt(10, agree2);
				pstmt.setInt(11, agree3);
				pstmt.setString(12, wright);
				pstmt.setString(13, roulette);
				pstmt.setInt(14, point);
				pstmt.setString(15, coupon);
				pstmt.setInt(16, CustSelno()+1);
				pstmt.executeUpdate();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pstmt.close();
			conn.close();
		}
	}

	public LoginDataBean information(String kid) throws Exception{//ȸ������
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		LoginDataBean loglist = new LoginDataBean();
			try{
				conn = getConnection();//db����
				String sql="select * from cust where id = ?";
				pstmt=conn.prepareStatement(sql);		
				pstmt.setString(1, kid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					loglist.setId(rs.getString("id"));
					loglist.setPw(rs.getString("pw"));
					loglist.setName(rs.getString("name"));
					loglist.setEmail(rs.getString("email"));
					loglist.setPhone(rs.getString("phone"));
					loglist.setAdd_full(rs.getString("add_full"));			
					/*loglist.setAdd_jibun(rs.getString("add_jibun"));	
					loglist.setAdd_no(rs.getString("add_no"));	*/
					loglist.setAgree1(rs.getInt("agree1"));	
					loglist.setAgree2(rs.getInt("agree2"));	
					loglist.setAgree3(rs.getInt("agree3"));	
					loglist.setWright(rs.getString("wright"));	
					/*loglist.setRoulette(rs.getString("roulette"));*/	
					loglist.setPoint(rs.getInt("point"));	
					/*loglist.setCoupon(rs.getString("coupon"));	*/
				}
			}catch(Exception e) {
				e.printStackTrace();	
			}finally {
				pstmt.close();
				conn.close();
			}
			return loglist;
	}
	
	
	public int userCheck(String id, String pw, HttpServletRequest request){
		int result=-1;
		String sql = "select * from cust where id=? and pw=?";
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		HttpSession session = request.getSession();
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pw")!=null && rs.getString("pw").equals(pw)){
					session.setAttribute("wright", String.valueOf(rs.getInt("wright")));
					session.setAttribute("custno", String.valueOf(rs.getInt("custno")));
					result=1;
				}				
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			return result;
		}
}