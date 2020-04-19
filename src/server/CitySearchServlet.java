package server;

import checking.check;

import citylist.ParseJson;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Collections;

import classes2.CityNameAscendingComparator;
import classes2.CityNameDescendingComparator;
import classes2.TempHighAscendingComparator;
import classes2.TempHighDescendingComparator;
import classes2.TempLowAscendingComparator;
import classes2.TempLowDescendingComparator;
import owndata.Weatherobj;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CitySearchServlet")
public class CitySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String city = request.getParameter("city");
    	
    	String latitude = request.getParameter("latitude");
    	if (latitude != null && latitude.length()>0) {
    		request.getRequestDispatcher("/LatLongSearchServlet").forward(request, response);
    		return;
    	}
    	HttpSession session = request.getSession();
    	String user=(String)session.getAttribute("username");
    	if(user!=null) {
    		check.add(city, user);}
    	
    	ArrayList<Weatherobj> selected = new ArrayList<Weatherobj>();

		ParseJson my_weather = new ParseJson();
		selected = my_weather.convert(city);
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
