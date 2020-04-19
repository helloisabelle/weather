package owndata;


import java.util.HashMap;
import java.util.Map;

public class List {

private Coord coord;
private Sys sys;
private java.util.List<Weather> weather = null;
private Main main;
private Integer visibility;
private Wind wind;
private Clouds clouds;
private Integer dt;
private Integer id;
private String name;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

public Coord getCoord() {
return coord;
}

public void setCoord(Coord coord) {
this.coord = coord;
}

public Sys getSys() {
return sys;
}

public void setSys(Sys sys) {
this.sys = sys;
}

public java.util.List<Weather> getWeather() {
return weather;
}

public void setWeather(java.util.List<Weather> weather) {
this.weather = weather;
}

public Main getMain() {
return main;
}

public void setMain(Main main) {
this.main = main;
}

public Integer getVisibility() {
return visibility;
}

public void setVisibility(Integer visibility) {
this.visibility = visibility;
}

public Wind getWind() {
return wind;
}

public void setWind(Wind wind) {
this.wind = wind;
}

public Clouds getClouds() {
return clouds;
}

public void setClouds(Clouds clouds) {
this.clouds = clouds;
}

public Integer getDt() {
return dt;
}

public void setDt(Integer dt) {
this.dt = dt;
}

public Integer getId() {
return id;
}

public void setId(Integer id) {
this.id = id;
}

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}
