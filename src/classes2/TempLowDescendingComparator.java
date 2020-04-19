package classes2;

import java.util.Comparator;

import owndata.Weatherobj;

public class TempLowDescendingComparator implements Comparator<Weatherobj> {

	@Override
	public int compare(Weatherobj w0, Weatherobj w1) {
		//return (int) (w1.getDayLow() - w0.getDayLow());
		
		if (w1.getDayLow() < w0.getDayLow()) return -1;
        if (w1.getDayLow() > w0.getDayLow()) return 1;
        return 0;
	}
	
}
