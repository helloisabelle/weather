package citylist;

import java.io.BufferedReader;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import owndata.Weatherobj;
import owndata.owm;


public class ParseJson {

    public ArrayList<cl> cities;
    
    public ParseJson(){
    	cities = this.parseFile();
    }

    public ArrayList<cl> parseFile() {
    	String path = "../hw33/WebContent/citylist.json";
    	BufferedReader bufferedReader = null;
		try {
			bufferedReader = new BufferedReader(new FileReader(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

    	Gson gson2 = new Gson();
    	Type listType = new TypeToken<ArrayList<cl>>(){}.getType();
    	ArrayList<cl> cities = gson2.fromJson(bufferedReader, listType);
    	try {
			bufferedReader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cities;
    }
    public Map<Integer, String> grab(String name){
    	Map<Integer, String> match = new HashMap<Integer, String>();
    	for (int x=0; x < cities.size(); x++) {
    		if (cities.get(x).getName().toLowerCase().equals(name.toLowerCase())) {
    			String country = cities.get(x).getCountry();
    			Integer id = cities.get(x).getId();
    			match.put(id, country);
    		}
    	}
    	
    	return match;
    }
    
    public ArrayList<Weatherobj> convert(String name){
//    	var Http = new XMLHttpRequest();
//    	String url = "http://api.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=imperial&appid=5c82cbf4bf152d9427964669351f3ec4";
//    	Http.open("GET", url);
//    	Http.send();
//    	Http.onreadystatechange=(e)=>{console.log(Http.responseText)}
  
    	Map<Integer, String> matches = grab(name);
    	ArrayList<Weatherobj> list = new ArrayList<Weatherobj>();
    	
    	URL oracle;
		try {
			Iterator<Map.Entry<Integer,String>> it = matches.entrySet().iterator();
		   while (it.hasNext()) {
		    	String url = "http://api.openweathermap.org/data/2.5/weather?id=";
		        Map.Entry<Integer, String> pair = (Map.Entry<Integer, String>)it.next();
		        url += pair.getKey();
		        it.remove(); // avoids a ConcurrentModificationException
		        url += "&units=imperial&appid=5c82cbf4bf152d9427964669351f3ec4";
		       // System.out.println(url);
		        oracle = new URL(url);
		        BufferedReader y = new BufferedReader(
			    	new InputStreamReader(oracle.openStream()));
			    	String inputLine = y.readLine();
			    	y.close();
			    	Gson gson = new Gson(); // Or use new GsonBuilder().create();
			    	owm obj = gson.fromJson(inputLine, owm.class);		    	
			    	Weatherobj new_item = new Weatherobj(obj.getId(), name, obj.getSys().getCountry(), obj.getCoord().getLat(), obj.getCoord().getLon(), obj.getSys().getSunrise(), obj.getSys().getSunset(), obj.getMain().getTemp(), obj.getMain().getTemp_min(), obj.getMain().getTemp_max(), obj.getMain().getHumidity(), obj.getWind().getSpeed());
			    	list.add(new_item); 
			    	
		   }
			    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return list;
    }
    
    public ArrayList<Weatherobj> convert2(Double lat, Double lng){
    	URL oracle;
    	ArrayList<Weatherobj> result = new ArrayList<Weatherobj>();
    	try {
		    	String url = "http://api.openweathermap.org/data/2.5/weather?lat=";
		        url += lat + "&lon=" + lng;
		        url += "&units=imperial&appid=5c82cbf4bf152d9427964669351f3ec4";
		        oracle = new URL(url);
		        BufferedReader y = new BufferedReader(new InputStreamReader(oracle.openStream()));
			    	String inputLine = y.readLine();
			    	y.close();
			    	Gson gson = new Gson(); // Or use new GsonBuilder().create();
			    	owm obj = gson.fromJson(inputLine, owm.class);		    	
			    	Weatherobj new_item = new Weatherobj(obj.getId(), obj.getName(), obj.getSys().getCountry(), obj.getCoord().getLat(), obj.getCoord().getLon(), obj.getSys().getSunrise(), obj.getSys().getSunset(), obj.getMain().getTemp(), obj.getMain().getTemp_min(), obj.getMain().getTemp_max(), obj.getMain().getHumidity(), obj.getWind().getSpeed());
			    	result.add(new_item); 
    	}
    	catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return result;
    }
    
    
//    public static void main(String[] args) {
//    	ParseJson x = new ParseJson();
//    	ArrayList<Weatherobj> y = x.convert("San Francisco");
//    }
    
}
