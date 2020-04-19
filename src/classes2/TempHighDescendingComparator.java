package classes2;

import java.util.Comparator;

import owndata.Weatherobj;

public class TempHighDescendingComparator implements Comparator<Weatherobj> {

	@Override
	public int compare(Weatherobj w0, Weatherobj w1) {
		//return w1.getDayHigh() - w0.getDayHigh();
		
		if (w1.getDayHigh() < w0.getDayHigh()) return -1;
        if (w1.getDayHigh() > w0.getDayHigh()) return 1;
        return 0;
	}

}
