package new_product;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/pay_wish_pro")
public class pay_wish_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public pay_wish_pro() {        super();    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DB_connect DB = new DB_connect();
		int totalProduct = Integer.parseInt(request.getParameter("totalProduct"));
		String selno="";
		for(int i=0; i<totalProduct; i++) {
			selno+="  "+request.getParameter("selno"+i);
		}
		
		orderT_data t_data = new orderT_data();
		
		t_data.setSelno(selno+"("+totalProduct+")");
		t_data.setTotalprice(Integer.parseInt(request.getParameter("totalprice")));
		t_data.setRcvemail(request.getParameter("rcvemail"));
		t_data.setRcvphone(request.getParameter("rcvphone"));
		t_data.setRcvname(request.getParameter("rcvname"));
		t_data.setRcvaddress(request.getParameter("add1")+" "+request.getParameter("add2")+" "+request.getParameter("add3"));
		t_data.setCustno(Integer.parseInt(request.getParameter("custno")));
		t_data.setMessage(request.getParameter("message"));
		
		DB.addorderT(t_data);
		
		int ordercount = DB.ordercount();
		
		
		ArrayList<orderE_data> e_data = new ArrayList<orderE_data>(); 
		orderE_data data = null;
		for(int i=0; i<totalProduct; i++) {
			data = new orderE_data();
			data.setOrderno(ordercount);
			data.setSelno(Integer.parseInt(request.getParameter("selno"+i)));
			data.setItemno(Integer.parseInt(request.getParameter("upd3"+i)));
			data.setItemname(request.getParameter("upd2"+i));
			data.setItemshape(request.getParameter("upd4"+i));
			data.setItemsize(request.getParameter("upd5"+i));
			data.setRcvaddress(t_data.getRcvaddress());
			data.setHowmany(Integer.parseInt(request.getParameter("upd1"+i)));
			data.setEachprice(Integer.parseInt(request.getParameter("eachprice"+i)));
			e_data.add(data);
		}
		DB.addorderE(e_data);
		
		DB.endwish(request.getParameter("custno"));
		
		response.sendRedirect("IKEA_com/IKEA_COM.jsp");
	}

}
