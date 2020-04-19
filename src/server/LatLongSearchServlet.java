package server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import checking.check;
import citylist.ParseJson;
import classes2.CityNameAscendingComparator;
import classes2.CityNameDescendingComparator;
import classes2.TempHighAscendingComparator;
import classes2.TempHighDescendingComparator;
import classes2.TempLowAscendingComparator;
import classes2.TempLowDescendingComparator;
import owndata.Weatherobj;

@WebServlet("/LatLongSearchServlet")
public class LatLongSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String latitude = request.getParameter("latitude");
    	String longitude = request.getParameter("longitude");
    	String city = "(" + latitude + ", " + longitude + ")";
    	
    	
    	HttpSession session = request.getSession();
    	String user=(String)session.getAttribute("username");
    	if(user!=null) {
    		check.add(city, user);}
    	Double lat = Double.parseDouble(latitude);
    	Double lng = Double.parseDouble(longitude);
    	
    	ArrayList<Weatherobj> selected = new ArrayList<Weatherobj>();
    	ParseJson my_weather = new ParseJson();
		selected = my_weather.convert2(lat, lng);
		session.setAttribute("selected", selected);
    	
//    	@SuppressWarnings("unchecked")
//		ArrayList<Weatherobj> cities = (ArrayList<Weatherobj>) session.getAttribute("cities");
//    	
//    	for(Weatherobj w : cities) {
//    		if(w.getLongitude() == Double.parseDouble(longitude) && w.getLatitude() == Double.parseDouble(latitude)) {
//    			selected.add(w);
//    		}
//    	}
    	
    	session.setAttribute("selected", selected);
    	
    	ArrayList<Weatherobj> nameasc = new ArrayList<Weatherobj>();
    	ArrayList<Weatherobj> namedes = new ArrayList<Weatherobj>();
    	ArrayList<Weatherobj> templowasc = new ArrayList<Weatherobj>();
    	ArrayList<Weatherobj> templowdes = new ArrayList<Weatherobj>();
    	ArrayList<Weatherobj> temphighasc = new ArrayList<Weatherobj>();
    	ArrayList<Weatherobj> temphighdes = new ArrayList<Weatherobj>();
    	
    	Collections.sort(selected, new CityNameAscendingComparator());
    	for(Weatherobj w : selected) {
    		nameasc.add(w.clone());
    	}
    	Collections.sort(selected, new CityNameDescendingComparator());
    	for(Weatherobj w : selected) {
    		namedes.add(w.clone());
    	}
    	Collections.sort(selected, new TempLowAscendingComparator());
    	for(Weatherobj w : selected) {
    		templowasc.add(w.clone());
    	}
    	Collections.sort(selected, new TempLowDescendingComparator());
    	for(Weatherobj w : selected) {
    		templowdes.add(w.clone());
    	}
    	Collections.sort(selected, new TempHighAscendingComparator());
    	for(Weatherobj w : selected) {
    		temphighasc.add(w.clone());
    	}
    	Collections.sort(selected, new TempHighDescendingComparator());
    	for(Weatherobj w : selected) {
    		temphighdes.add(w.clone());
    	}
    	
    	session.setAttribute("nameasc", nameasc);
    	session.setAttribute("namedes", namedes);
    	session.setAttribute("templowasc", templowasc);
    	session.setAttribute("templowdes", templowdes);
    	session.setAttribute("temphighasc", temphighasc);
    	session.setAttribute("temphighdes", temphighdes);
    	
    	RequestDispatcher rd = request.getRequestDispatcher("/Results.jsp");
    	rd.forward(request, response);
    }
}
