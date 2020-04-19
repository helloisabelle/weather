package server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import owndata.Weatherobj;

@WebServlet("/GetDetailsServlet")
public class GetDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	String city = request.getParameter("city");
		int id = -1;
	//	String idd = request.getParameter("id");
		id = Integer.parseInt(request.getParameter("city"));
	//	String latitude = request.getParameter("latitude");
	//	String longitude = request.getParameter("longitude");
		
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Weatherobj> cities = (ArrayList<Weatherobj>) session.getAttribute("selected");
		
		Weatherobj w = null;
		if (id != -1) {
			for(Weatherobj Weatherobj: cities) {
				if(Weatherobj.getId() == id) {
					w = Weatherobj;
				}
			}
		}
//		else if(city != null) {
//			for(Weatherobj Weatherobj: cities) {
//				if(Weatherobj.getCity().equals(city)) {
//					w = Weatherobj;
//				}
//			}
//		}
//		else if(latitude != null && longitude != null) {
//			for(Weatherobj Weatherobj: cities) {
//				if(Weatherobj.getLatitude() == Double.parseDouble(latitude) && Weatherobj.getLongitude() == Double.parseDouble(longitude)) {
//					w = Weatherobj;
//				}
//			}
//		}
		
		session.setAttribute("city", w);
	}
}
