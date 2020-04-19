package classes2;

import java.util.Comparator;

import owndata.Weatherobj;

public class CityNameDescendingComparator implements Comparator<Weatherobj> {

	@Override
	public int compare(Weatherobj w0, Weatherobj w1) {
		return w0.getNamec().compareTo(w1.getNamec()) * -1;
	}

}
