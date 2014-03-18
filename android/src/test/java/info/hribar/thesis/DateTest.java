package info.hribar.thesis;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

/**
 * Tests for {@link Date}.
 */
@RunWith(JUnit4.class)
public class DateTest {

	@Test
	public void testInit() {
		Date date = new Date(2013, 11, 30);
		assertEquals("Year not same", date.getYear(), 2013);
		assertEquals("Month not same", date.getMonth(), 11);
		assertEquals("Day not same", date.getDay(), 30);
	}

	@Test
	public void testSetDate() {
		Date date = new Date(2014, 1, 1);
		date.setDate(2013,1,1);
		assertEquals("Year not same", date.getYear(), 2013);
		assertEquals("Month not same", date.getMonth(), 1);
		assertEquals("Day not same", date.getDay(), 1);
	}

	@Test
	public void testSetYear() {
		Date date = new Date(2014, 1, 1);
		date.setYear(2013);
		assertEquals("Year not same", date.getYear(), 2013);
	}

	@Test
	public void testSetMonth() {
		Date date = new Date(2014, 1, 1);
		date.setMonth(2);
		assertEquals("Month not same", date.getMonth(), 2);
	}

	@Test
	public void testSetDay() {
		Date date = new Date(2014, 1, 1);
		date.setDay(2);
		assertEquals("Day not same", date.getDay(), 2);
	}

	@Test
	public void testAddDays() {
		Date date = new Date(2014, 1, 1);
		date.addDays(-1);
		assertEquals("Year not same", date.getYear(), 2013);
		assertEquals("Month not same", date.getMonth(), 12);
		assertEquals("Day not same", date.getDay(), 31);
	}

	@Test
	public void testAddMonths() {
		Date date = new Date(2014, 1, 1);
		date.addMonths(2);
		assertEquals("Year not same", date.getYear(), 2014);
		assertEquals("Month not same", date.getMonth(), 3);
		assertEquals("Day not same", date.getDay(), 1);
	}

	@Test
	public void testAddYears() {
		Date date = new Date(2014, 1, 1);
		date.addYears(1);
		assertEquals("Year not same", date.getYear(), 2015);
		assertEquals("Month not same", date.getMonth(), 1);
		assertEquals("Day not same", date.getDay(), 1);
	}

	@Test
	public void testToString() {
		Date date = new Date(2014, 1, 1);
		assertTrue("String not same", date.toString().equals("2014-01-01"));
	}

	@Test
	public void testIsBefore() {
		Date date = new Date(2014, 1, 1);
		assertTrue("Is not before", date.isBefore(new Date(2015, 1, 1)));
		assertFalse("Is before", date.isBefore(new Date(2014, 1, 1)));
	}

	@Test
	public void testIsAfter() {
		Date date = new Date(2014, 1, 1);
		assertTrue("Is not after", date.isAfter(new Date(2013, 1, 1)));
		assertFalse("Is after", date.isAfter(new Date(2014, 1, 1)));
	}

	@Test
	public void testIsEqual() {
		Date date = new Date(2014, 1, 1);
		assertTrue("Is not equal", date.isEqual(new Date(2014, 1, 1)));
		assertFalse("Is equal", date.isEqual(new Date(2015, 1, 1)));
	}

	@Test
	public void testIsLastDay() {
		Date date = new Date(2014, 1, 31);
		assertTrue("Is not last day", date.isLastDay());
		date.setDay(3);
		assertFalse("Is last day", date.isLastDay());
	}

	@Test
	public void testGetWeekday() {
		Date date = new Date(2014, 1, 4);
		assertEquals("Weekday not saturday", Weekday.SATURDAY, date.getWeekday());

		date = new Date(2014, 1, 1);
		assertEquals("Weekday not wednesday", Weekday.WEDNESDAY, date.getWeekday());
	}
}
