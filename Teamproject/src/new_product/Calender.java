package new_product;

import java.util.Calendar;
public class Calender {
	public static int[] calen() {
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int day = today.get(Calendar.DAY_OF_MONTH);
		int lastday = today.getActualMaximum(Calendar.DATE);
		today.set(year, month-1, 1);
		int yoil=today.get(Calendar.DAY_OF_WEEK);

		int[] date = {year,month,day,lastday,yoil};
		
//		System.out.println("이 해의 년도 : " + year);  
//		System.out.println("월(1~12) : " + month);
//		System.out.println("이 달의 몇 일 : " + day);
//		System.out.println("이 달의 마지막 날: : " + lastday);		
//		System.out.println("이 달의 첫번째 요일 : "+yoil);
		return date;
	}
}
