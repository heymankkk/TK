package new_product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.ReviewDBBean;
import project.ReviewDataDB;

@WebServlet("/view_ReviewSubmit")
public class view_ReviewSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public view_ReviewSubmit() {      super();  }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		int item = Integer.parseInt(request.getParameter("citem"));
		int startRow = 1;
		int pageSize = 7;
		String choice = "reg_date asc";
		ReviewDataDB reviewlist = new ReviewDataDB();
		
		reviewlist.setStarscore(request.getParameter("starscore"));
		reviewlist.setNickname(request.getParameter("nickname"));
		reviewlist.setSubject(request.getParameter("subject"));
		reviewlist.setContent(request.getParameter("content"));
		reviewlist.setReg_date(request.getParameter("reg_date"));
		reviewlist.setItemno(item);
		
		ReviewDBBean rdb = ReviewDBBean.getReviewDB();
		
		DB_connect DB = new DB_connect();
		try {
			rdb.insertreview12(reviewlist);
			rdb.loadreview(item, choice, startRow, pageSize);
			
			int avg = rdb.reviewavg(item);
			DB.setScore(request.getParameter("citem"), avg);
			
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=view_product.jsp&itemno="+item);
		}catch(Exception e){
			
		}
	}

}
