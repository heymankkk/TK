package new_product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cart_pro")
public class cart_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public cart_pro() {        super();    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<ArrayList> totallist = (ArrayList)session.getAttribute("cartList");
		String num=request.getParameter("num");
		if(num!=null) {
			int num2 =Integer.parseInt(num);
			totallist.remove(num2);
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=cart.jsp");
		}
		
		String a=request.getParameter("a");
		String d=request.getParameter("d");
		if(a!=null) {
			int n=Integer.parseInt(request.getParameter("n"));
			totallist.get(n).set(0, a);
			totallist.get(n).set(6, d);
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=cart.jsp");
		}
	}
}
