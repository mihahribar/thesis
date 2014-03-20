package info.hribar.thesis;

import java.util.Map;

public class Recurrence
{
	private long nativeHandle = 0;

	public native void init(Frequency freq, Date start);
	public native Map<Integer, Date> daysInRange(Date from, Date to);

	public native Date getStart();
	public native void setStart(Date start);

	public native Date getUntil();
	public native void setUntil(Date until);

	public native Frequency getFrequency();
	public native void setFrequency(Frequency freq);

	public native int getInterval();
	public native void setInterval(int interval);

	public native int getCount();
	public native void setCount(int count);

	public native String getByDay();
	public native void setByDay(String byday);

	public native String getByMonthDay();
	public native void setByMonthDay(String bymonthday);

	static {
		System.loadLibrary("thesis");
	}
}