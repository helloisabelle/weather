package owndata;

public class Weatherobj {
	private int id;
	private String city;
	private String country;
	private double latitude;
	private double longitude;
	private int sunrise;
	private int sunset;
	private double currentTemperature;
	private Double dayLow;
	private Double dayHigh;
	private int humidity;
	private double windspeed;
	private String namec;
	
	public Weatherobj(){}
	
	public Weatherobj(int id, String city, String country, double latitude, double longitude, int sunrise, int sunset, double currentTemperature, Double dayLow, Double dayHigh, int humidity, double windspeed){
			this.id = id;
			this.city = city;
			this.country = country;
			this.latitude = latitude;
			this.longitude = longitude;
			this.sunrise = sunrise;
			this.sunset = sunset;
			this.currentTemperature = currentTemperature;
			this.dayLow = dayLow;
			this.dayHigh = dayHigh;
			this.humidity = humidity;
			this.windspeed = windspeed;	
			this.namec = city + ", " + country;
	}

	public Weatherobj clone() {
		Weatherobj w = new Weatherobj();
		w.id = id;
		w.namec = this.namec;
		w.city = this.city;
		w.country = this.country;
		w.latitude = this.latitude;
		w.longitude = this.longitude;
		w.sunrise = this.sunrise;
		w.sunset = this.sunset;
		w.currentTemperature = this.currentTemperature;
		w.dayLow = this.dayLow;
		w.dayHigh = this.dayHigh;
		w.humidity = this.humidity;
		w.windspeed = this.windspeed;
		return w;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNamec() {
		return namec;
	}
	public void setNamec(String namec) {
		this.namec = namec;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Double getCurrentTemperature() {
		return currentTemperature;
	}
	public void setCurrentTemperature(Double currentTemperature) {
		this.currentTemperature = currentTemperature;
	}
	public Double getDayLow() {
		return dayLow;
	}
	public void setDayLow(Double dayLow) {
		this.dayLow = dayLow;
	}
	public Double getDayHigh() {
		return dayHigh;
	}
	public void setDayHigh(Double dayHigh) {
		this.dayHigh = dayHigh;
	}
	public int getHumidity() {
		return humidity;
	}
	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}
	public double getWindspeed() {
		return windspeed;
	}
	public void setWindspeed(double windspeed) {
		this.windspeed = windspeed;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getSunrise() {
		return sunrise;
	}
	public void setSunrise(int sunrise) {
		this.sunrise = sunrise;
	}
	public int getSunset() {
		return sunset;
	}
	public void setSunset(int sunset) {
		this.sunset = sunset;
	}
}