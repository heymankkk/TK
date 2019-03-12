package project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewSubmit")
public class ReviewSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ReviewSubmit() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		int item = Integer.parseInt(request.getParameter("citem"));
		int startRow = 1;
		int pageSize = 7;
		String choice = "reg_date asc";
		//데이터를 저장하기위한 DataDB
		ReviewDataDB reviewlist = new ReviewDataDB();
		
		reviewlist.setStarscore(request.getParameter("starscore"));
		reviewlist.setNickname(request.getParameter("nickname"));
		reviewlist.setSubject(request.getParameter("subject"));
		reviewlist.setContent(request.getParameter("content"));
		reviewlist.setReg_date(request.getParameter("reg_date"));
		reviewlist.setItemno(item);
		
		//DB연결하기위한 DBBean
		ReviewDBBean rdb = ReviewDBBean.getReviewDB();
		
		try {
			rdb.insertreview(reviewlist);
			rdb.loadreview(item, choice, startRow, pageSize);
			response.sendRedirect("sofa/itempage.jsp?itemno="+item);
		}catch(Exception e){
			
		}
	}

}
