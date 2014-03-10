package info.hribar.app;

import info.hribar.thesis.Date;

public class App
{
	public static void main(String[] args) {
		Date date = new Date(2013, 11, 31);
		System.out.println(date.toString());
		date.addDays(1);
		System.out.println(date.toString());
		date.addMonths(1);
		System.out.println(date.toString());
	}
}