package HomeFurnishing;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class Homefurnishing_upload
 */
@WebServlet("/Homefurnishing_upload")
public class Homefurnishing_upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homefurnishing_upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*request.getParameter("submit_hashtag");
		request.getParameter("submit_img");
		request.getParameter("submit_title");
		request.getParameter("submit_content");*/
		
		String realFolder="";
		// 저장폴더
		String saveFolder="/img/HomeFurnishing/content";
		// 인코딩 방식 (UTF-8)
		String encType="utf-8";
		// 최대 업로드 파일크기(10mb)
		int maxSize=10*1024*1024;
		
		ServletContext context = getServletContext();
		realFolder=context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		HomefurnishingServer HFS = HomefurnishingServer.getHomefurnishingServer();
		HomefurnishingData HFD = new HomefurnishingData();
		
		HFD.setHomehashtag(multi.getParameter("submit_select"));
		HFD.setHomeimg(multi.getFilesystemName("submit_img"));
		HFD.setHomewriter(multi.getParameter("submit_writer"));
		HFD.setHometitle(multi.getParameter("submit_title"));
		HFD.setHomecontent(multi.getParameter("submit_content"));
		
		try {
			HFS.insertData(HFD);
			response.sendRedirect("http://localhost:8090/Teamproject/index/HomeFurnishing.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
