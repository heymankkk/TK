package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");		
		HttpSession session = request.getSession();
		
		LoginDBBean ldb = LoginDBBean.getLdb();
		try {
			if(1==ldb.userCheck(id, pw, request)) {
				session.setAttribute("id", id);
				response.sendRedirect("index/MainContent.jsp");
			}
			else {
				
				session.setAttribute("error", "아이디 & 비밀번호를 잘못입렸했습니다.");
				response.sendRedirect("login/login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

