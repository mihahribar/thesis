package info.hribar.thesis;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

/**
 * Tests for {@link Recurrence}.
 */
@RunWith(JUnit4.class)
public class RecurrenceTest
{
	@Test
	public void testInit() {
		Recurrence rec = new Recurrence(Frequency.MONTHLY, new Date(2014, 1, 1));
		assertEquals("Frequency not same", rec.getFrequency(), Frequency.MONTHLY);
		assertEquals("Year not same", date.getStart().getYear(), 2014);
		assertEquals("Month not same", date.getStart().getMonth(), 1);
		assertEquals("Day not same", date.getStart().getDay(), 1);
	}
}