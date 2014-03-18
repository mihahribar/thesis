package info.hribar.thesis;

public class Date
{
	private long nativeHandle = 0;
	public native void init(int year, int month, int day);

	public native void setDate(int year, int month, int day);
	public native void setYear(int year);
	public native void setMonth(int month);
	public native void setDay(int day);

	public native int getYear();
	public native int getMonth();
	public native int getDay();

	public native void addDays(int days);
	public native void addMonths(int months);
	public native void addYears(int years);

	public native String toString();

	public native boolean isBefore(Date date);
	public native boolean isAfter(Date date);
	public native boolean isEqual(Date date);
	public native boolean isLastDay();

	public native Weekday getWeekday();

	public Date(int year, int month, int day) {
		init(year, month, day);
	}

	static {
		System.loadLibrary("thesis");
	}
}
