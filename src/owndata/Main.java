package owndata;

import java.util.HashMap;
import java.util.Map;

public class Main {

private Double temp;
private Double pressure;
private Integer humidity;
private Double temp_min;
private Double temp_max;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

public Double getTemp() {
return temp;
}

public void setTemp(Double temp) {
this.temp = temp;
}

public Double getTemp_min() {
return temp_min;
}

public void setTemp_min(Double tempMin) {
this.temp_min = tempMin;
}

public Double getTemp_max() {
return temp_max;
}

public void setTemp_max(Double tempMax) {
this.temp_max = tempMax;
}

public Double getPressure() {
return pressure;
}

public void setPressure(Double pressure) {
this.pressure = pressure;
}

public Integer getHumidity() {
return humidity;
}

public void setHumidity(Integer humidity) {
this.humidity = humidity;
}

public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}