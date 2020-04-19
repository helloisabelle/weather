package classes2;

import java.util.Comparator;

import owndata.Weatherobj;

public class TempLowAscendingComparator implements Comparator<Weatherobj> {

	@Override
	public int compare(Weatherobj w0, Weatherobj w1) {
		//return w0.getDayLow() - w1.getDayLow();
		
		if (w0.getDayLow() < w1.getDayLow()) return -1;
        if (w0.getDayLow() > w1.getDayLow()) return 1;
        return 0;
	}

}
