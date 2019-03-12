package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memberServlet")
public class memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memberServlet() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add_full = request.getParameter("juso");
		String add_jibun = request.getParameter("jibunAddr");
		String add_no = request.getParameter("zipNo");
		int agree1 = 0;
		int agree2 = 0;
		int agree3 = 0;
		if(request.getParameter("agree1")=="on") {
			agree1 = 1;
		}
		
		if(request.getParameter("agree2")=="on") {
			agree2 = 1;
		}
		if(request.getParameter("agree3")=="on") {
			agree3 = 1;
		}
		String wright = request.getParameter("wright");
		String roulette = request.getParameter("roulette");
		int point = 0;
		if(request.getParameter("point")!=null) {
			point = Integer.parseInt(request.getParameter("point"));
		}
		String coupon = null;
		if(request.getParameter("coupon")!=null) {
			coupon = request.getParameter("coupon");
		}
		LoginDBBean ldb = LoginDBBean.getLdb();
		LoginDataBean ltb = new LoginDataBean();
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		try {
			ltb.setId(id);
			ltb.setPw(pw);
			ltb.setName(name);
			ltb.setEmail(email);
			ltb.setPhone(phone);
			ltb.setAdd_full(add_full);
			ltb.setAdd_jibun(add_jibun);
			ltb.setAdd_no(add_no);
			ltb.setAgree1(agree1);
			ltb.setAgree2(agree2);
			ltb.setAgree3(agree3);
			ltb.setWright(wright);
			ltb.setRoulette(roulette);
			ltb.setPoint(point);
			ltb.setCoupon(coupon);
			ldb.insertCust(ltb);		
			
			response.sendRedirect("login/mypage.jsp?id="+id);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
