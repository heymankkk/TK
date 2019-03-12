package new_product;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/item_upload_process")
public class item_upload_process extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public item_upload_process() {   super();    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			//String realFolder="";
			String realFolder="\\\\192.168.0.61\\upload\\img_item\\";
			//String saveFolder="/img_item";
			int maxSize=10485760;  // 2^10 * 2^10 * 10 - 10Mb
			String encType="UTF-8";
			//ServletContext context = getServletContext();
			//realFolder=context.getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
			DB_data data = new DB_data();
			data.setItemname(multi.getParameter("itemname"));
			data.setItemprice(Long.parseLong(multi.getParameter("itemprice")));
			data.setSelno(Integer.parseInt(multi.getParameter("selno")));
			data.setItemcontent(multi.getParameter("itemcontent"));
			data.setCategory1(multi.getParameter("category1"));		data.setCategory2(multi.getParameter("category2"));
			data.setImage1(multi.getFilesystemName("image1"));		data.setImage2(multi.getFilesystemName("image2"));
			data.setImage3(multi.getFilesystemName("image3"));		data.setImage4(multi.getFilesystemName("image4"));
			data.setImage5(multi.getFilesystemName("image5"));
			data.setItemshape1(multi.getParameter("itemshape1"));		data.setItemshape2(multi.getParameter("itemshape2"));
			data.setItemshape3(multi.getParameter("itemshape3"));		data.setItemshape4(multi.getParameter("itemshape4"));
			data.setItemshape5(multi.getParameter("itemshape5"));		data.setItemshape6(multi.getParameter("itemshape6"));
			data.setItemshape7(multi.getParameter("itemshape7"));		data.setItemshape8(multi.getParameter("itemshape8"));
			data.setItemshape9(multi.getParameter("itemshape9"));		data.setItemshape10(multi.getParameter("itemshape10"));
			data.setItemsize1(multi.getParameter("itemsize1"));		data.setItemsize2(multi.getParameter("itemsize2"));
			data.setItemsize3(multi.getParameter("itemsize3"));		data.setItemsize4(multi.getParameter("itemsize4"));
			data.setItemsize5(multi.getParameter("itemsize5"));		data.setItemsize6(multi.getParameter("itemsize6"));
			data.setItemsize7(multi.getParameter("itemsize7"));		data.setItemsize8(multi.getParameter("itemsize8"));
			data.setItemsize9(multi.getParameter("itemsize9"));		data.setItemsize10(multi.getParameter("itemsize10"));

			DB_connect DB = DB_connect.getDB();
			DB.write(data);
			int count = DB.count();
			response.sendRedirect("IKEA_com/IKEA_COM.jsp?pageName=view_product.jsp&&itemno="+count);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
