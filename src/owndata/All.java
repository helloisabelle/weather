package owndata;

import java.util.HashMap;
import java.util.Map;

public class All {

private Integer cnt;
private java.util.List<owndata.List> list = null;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

public Integer getCnt() {
return cnt;
}

public void setCnt(Integer cnt) {
this.cnt = cnt;
}

public java.util.List<owndata.List> getList() {
return list;
}

public void setList(java.util.List<owndata.List> list) {
this.list = list;
}

public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}