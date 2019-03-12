package new_product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import new_product.DB_connect;
@WebServlet("/wish_pro")
public class wish_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public wish_pro() {        super();    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("method").equals("add")) {
			int custno=Integer.parseInt(request.getParameter("custno"));
			int count=Integer.parseInt(request.getParameter("count"));
			int itemno=Integer.parseInt(request.getParameter("itemno"));
			int price=Integer.parseInt(request.getParameter("price"));
			int selno=Integer.parseInt(request.getParameter("selno"));
			String shape=request.getParameter("shape");
			String size=request.getParameter("size");
			
			DB_connect DB = DB_connect.getDB();
			DB.addwish(custno, count, itemno, shape, size, price, selno);
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=wish.jsp&custno="+custno);
			
		}else if(request.getParameter("method").equals("del")) {
			int custno=Integer.parseInt(request.getParameter("custno"));
			int count=Integer.parseInt(request.getParameter("count"));
			int itemno=Integer.parseInt(request.getParameter("itemno"));
			String shape=request.getParameter("shape");
			String size=request.getParameter("size");
			
			DB_connect DB = DB_connect.getDB();
			DB.delwish(custno, count, itemno, shape, size);
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=wish.jsp&custno="+custno);
	
		}else if(request.getParameter("method").equals("upd")) {
			int custno=Integer.parseInt(request.getParameter("custno"));
			int count=Integer.parseInt(request.getParameter("count"));
			int itemno=Integer.parseInt(request.getParameter("itemno"));
			String shape=request.getParameter("shape");
			String size=request.getParameter("size");
			
			DB_connect DB = DB_connect.getDB();
			DB.updwish(custno, count, itemno, shape, size);
			response.sendRedirect("/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=wish.jsp&custno="+custno);
		}
	}

}
