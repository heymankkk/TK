package new_product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/roulette_pro")
public class roulette_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public roulette_pro() {        super();    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String[] pArr = {"20","1000","10%할인쿠폰","5000","10","무료배송쿠폰","10","50%할인쿠폰"};
		DB_connect DB = new DB_connect();
		int part = Integer.parseInt(request.getParameter("part"));
		String custno = request.getParameter("custno");
		String today = request.getParameter("today");
		String month = request.getParameter("month");
		try {
			if(part==2 || part==5 || part==7) {
				//쿠폰컬럼에 입력
				DB.roulette_coupon(custno, pArr[part]);
			}else {
				//포인트컬럼에 입력
				DB.roulette_point(custno, pArr[part]);
			}
			//상관없이 룰렛컬럼에 입력  
			DB.roulette(custno, pArr[part], part, today, month);
			response.sendRedirect("/Teamproject/IKEA_com/roulette.jsp?part="+part);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
