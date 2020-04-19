package classes2;

import java.util.Comparator;

import owndata.Weatherobj;

public class TempHighAscendingComparator implements Comparator<Weatherobj> {

	@Override
	public int compare(Weatherobj w0, Weatherobj w1) {
		//return w0.getDayHigh() - w1.getDayHigh();
		
		if (w0.getDayHigh() < w1.getDayHigh()) return -1;
        if (w0.getDayHigh() > w1.getDayHigh()) return 1;
        return 0;
        
        
	}

}	
