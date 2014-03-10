/**
 * RecurrenceTest.cpp
 *
 * @author Miha Hribar
 * @package thesis
 * @version 1.0
 */

#include "Recurrence.hpp"
#include "Date.hpp"
#include "gmock/gmock.h"

using testing::Eq;

namespace Thesis {
    class RecurrenceTest: public testing::Test {
    };

    // helper method for comparing maps
    void compareMaps(map<int, Date> *first, map<int, Date> *second) {
        ASSERT_THAT(first->size() == second->size(), Eq(true));
        for(map<int, Date>::iterator it = first->begin(); it != first->end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            map<int, Date>::iterator its;
            its = second->find(iteration);
            ASSERT_THAT(its != second->end(), Eq(true));
            Date com = its->second;
            ASSERT_THAT(day.isEqual(com), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, initMonthlyStart) {
        Recurrence rec = Recurrence(Monthly, Date(2013, 12, 2));
        ASSERT_THAT(rec.getUntil().getYear(), Eq(9999));
        ASSERT_THAT(rec.getFrequency(), Eq(Monthly));
        ASSERT_THAT(rec.getInterval(), Eq(1));
        ASSERT_THAT(rec.getCount(), Eq(0));
    }

    TEST_F(RecurrenceTest, updates) {
        Recurrence rec = Recurrence(Monthly, Date(2013, 12, 2));
        rec.setFrequency(Daily);
        ASSERT_THAT(rec.getFrequency(), Eq(Daily));

        rec.setStart(Date(2013, 12, 3));
        ASSERT_THAT(rec.getStart().isEqual(Date(2013, 12, 3)), Eq(true));

        rec.setInterval(2);
        ASSERT_THAT(rec.getInterval(), Eq(2));

        rec.setCount(2);
        ASSERT_THAT(rec.getCount(), Eq(2));

        rec.setUntil(Date(2014,1,1));
        ASSERT_THAT(rec.getUntil().isEqual(Date(2014,1,1)), Eq(true));
    }

    TEST_F(RecurrenceTest, daysInRangeDaily) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(28));
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, iteration+1)), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyDoubleRange) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(28));
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, iteration+1)), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyHalfRange) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 14), Date(2014, 2, 14));
        ASSERT_THAT(days.size(), Eq(14));
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, iteration+1)), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyEndDate) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        rec.setUntil(Date(2014, 2, 14));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(14));
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, iteration+1)), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyDateStartBeforeRange) {
        Recurrence rec = Recurrence(Daily, Date(2014, 1, 1));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 14));
        ASSERT_THAT(days.size(), Eq(14));
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, iteration-30)), Eq(true));
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyInterval) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        rec.setInterval(2);
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(14));
        int i = 0;
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, 2*i+1)), Eq(true));
            i++;
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyDateCount) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        rec.setCount(2);
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(2));
        int i = 1;
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, i)), Eq(true));
            i++;
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyEndDateIntervalCount) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        rec.setInterval(3);
        rec.setCount(4);
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(4));
        int i = 0;
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, 3*i+1)), Eq(true));
            i++;
        }
    }

    TEST_F(RecurrenceTest, daysInRangeDailyEndInMiddleOfRangeStartBeforeRange) {
        Recurrence rec = Recurrence(Daily, Date(2014, 1, 1));
        rec.setUntil(Date(2014, 2, 14));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(14));
        int i = 1;
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, i)), Eq(true));
            i++;
        }
    }

    TEST_F(RecurrenceTest, daysInRangeMonthly) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(1));
        Date day = days.begin()->second;
        ASSERT_THAT(day.isEqual(Date(2014, 2, 1)), Eq(true));
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyRepeatEndOfRange) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 28));
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(1));
        Date day = days.begin()->second;
        ASSERT_THAT(day.isEqual(Date(2014, 2, 28)), Eq(true));

    }

    TEST_F(RecurrenceTest, daysInRangeDailyByDayIgnored) {
        Recurrence rec = Recurrence(Daily, Date(2014, 2, 1));
        rec.setByDay("MO");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(28));
        for (int i = 0; i < days.size(); i++) {
            ASSERT_THAT(days.at(i).isEqual(Date(2014, 2, i+1)), Eq(true));
        }
        int i = 1;
        for(map<int, Date>::iterator it = days.begin(); it != days.end(); it++) {
            int iteration = it->first;
            Date day = it->second;
            ASSERT_THAT(day.isEqual(Date(2014, 2, i)), Eq(true));
            i++;
        }
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyByDay) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setByDay("MO");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(4));
        map<int, Date> result;
        result[5] = Date(2014, 2, 3);
        result[6] = Date(2014, 2, 10);
        result[7] = Date(2014, 2, 17);
        result[8] = Date(2014, 2, 24);
        compareMaps(&days, &result);
    }


    TEST_F(RecurrenceTest, daysInRangeWeeklyByDayTwoDays) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setByDay("MO,WE");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        result[10] = Date(2014, 2, 5);
        result[11] = Date(2014, 2, 10);
        result[12] = Date(2014, 2, 12);
        result[13] = Date(2014, 2, 17);
        result[14] = Date(2014, 2, 19);
        result[15] = Date(2014, 2, 24);
        result[16] = Date(2014, 2, 26);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyByDayTwoDaysSpace) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setByDay("MO, WE");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        result[10] = Date(2014, 2, 5);
        result[11] = Date(2014, 2, 10);
        result[12] = Date(2014, 2, 12);
        result[13] = Date(2014, 2, 17);
        result[14] = Date(2014, 2, 19);
        result[15] = Date(2014, 2, 24);
        result[16] = Date(2014, 2, 26);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyCountByDayTwoDays) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setCount(11);
        rec.setByDay("MO,WE");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        result[10] = Date(2014, 2, 5);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyCountByDayTwoDaysInterval) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setCount(7);
        rec.setByDay("MO,WE");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[5] = Date(2014, 2, 10);
        result[6] = Date(2014, 2, 12);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyByDayTwoDaysInterval) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setByDay("MO,WE"); // every second monday and wednesday
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[5] = Date(2014, 2, 10);
        result[6] = Date(2014, 2, 12);
        result[7] = Date(2014, 2, 24);
        result[8] = Date(2014, 2, 26);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByDayTwoDaysSpace) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByDay("MO, WE");
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        result[10] = Date(2014, 2, 5);
        result[11] = Date(2014, 2, 10);
        result[12] = Date(2014, 2, 12);
        result[13] = Date(2014, 2, 17);
        result[14] = Date(2014, 2, 19);
        result[15] = Date(2014, 2, 24);
        result[16] = Date(2014, 2, 26);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyCountByDayTwoDays) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setCount(11);
        rec.setByDay("MO,WE"); // every monday and wednesday, every month, 11 times
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        result[10] = Date(2014, 2, 5);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyCountByDayTwoDaysEndDate) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setCount(11);
        rec.setUntil(Date(2014,2,3));
        rec.setByDay("MO,WE"); // every monday and wednesday, every month, 11 times
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[9] = Date(2014, 2, 3);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByDayTwoDaysInterval) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setByDay("MO,WE"); // every monday and wednesday, every other month
        map<int, Date> days = rec.daysInRange(Date(2014, 2, 1), Date(2014, 2, 28));
        ASSERT_THAT(days.size(), Eq(0));

        days = rec.daysInRange(Date(2014, 1, 14), Date(2014, 3, 14));
        map<int, Date> result;
        result[4] = Date(2014, 1, 15);
        result[5] = Date(2014, 1, 20);
        result[6] = Date(2014, 1, 22);
        result[7] = Date(2014, 1, 27);
        result[8] = Date(2014, 1, 29);
        result[9] = Date(2014, 3, 3);
        result[10] = Date(2014, 3, 5);
        result[11] = Date(2014, 3, 10);
        result[12] = Date(2014, 3, 12);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByDayTwoDaysIntervalCount) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setCount(4);
        rec.setByDay("MO,WE"); // every monday and wednesday, every other month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 14));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 6);
        result[2] = Date(2014, 1, 8);
        result[3] = Date(2014, 1, 13);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByDayTwoDaysIntervalCountEndDate) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setCount(4);
        rec.setUntil(Date(2014, 1, 10));
        rec.setByDay("MO,WE"); // every monday and wednesday, every other month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 14));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 6);
        result[2] = Date(2014, 1, 8);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDay) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("1");
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 2, 1);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayDifferentStartDate) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("5");
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 5);
        result[2] = Date(2014, 2, 5);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDaySkip) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("31"); // on the 31st of the month, skip if there is no 31st of the month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        result[2] = Date(2014, 3, 31);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDaySkipInterval) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(3);
        rec.setByMonthDay("31"); // on the 31st of the month, skip if there is no 31st of the month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 7, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        result[2] = Date(2014, 7, 31);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayDontSkip) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("28"); // on the 28th of the month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 28);
        result[2] = Date(2014, 2, 28);
        result[3] = Date(2014, 3, 28);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayPositive) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("+1");
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 2, 1);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayNegative) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("-1"); // last day of the month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        result[2] = Date(2014, 2, 28);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayNegative2) {
        Recurrence rec = Recurrence(Monthly, Date(2013, 12, 30));
        rec.setByMonthDay("-2"); // two days from the end of the month
        map<int, Date> days = rec.daysInRange(Date(2013, 12, 30), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2013, 12, 30);
        result[1] = Date(2014, 1, 30);
        result[2] = Date(2014, 2, 27);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayMore) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("1,5,15"); // 1,5,15 of each month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 5);
        result[2] = Date(2014, 1, 15);
        result[3] = Date(2014, 2, 1);
        result[4] = Date(2014, 2, 5);
        result[5] = Date(2014, 2, 15);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayEvenMore) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setByMonthDay("1,5,-1"); // 1, 5, and last of each month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 2, 28));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 5);
        result[2] = Date(2014, 1, 31);
        result[3] = Date(2014, 2, 1);
        result[4] = Date(2014, 2, 5);
        result[5] = Date(2014, 2, 28);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayInterval) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setByMonthDay("-1"); // last of each other month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        result[2] = Date(2014, 3, 31);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayIntervalCount) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setCount(2);
        rec.setByMonthDay("-1"); // last of each other month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeMonthlyByMonthDayIntervalUntil) {
        Recurrence rec = Recurrence(Monthly, Date(2014, 1, 1));
        rec.setInterval(2);
        rec.setUntil(Date(2014,2,28));
        rec.setByMonthDay("-1"); // last of each other month
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 3, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeWeeklyByMonthDay) {
        Recurrence rec = Recurrence(Weekly, Date(2014, 1, 1));
        rec.setByMonthDay("-1"); // last of each week?, ignore
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2014, 1, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 8);
        result[2] = Date(2014, 1, 15);
        result[3] = Date(2014, 1, 22);
        result[4] = Date(2014, 1, 29);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeYearly) {
        Recurrence rec = Recurrence(Yearly, Date(2013, 1, 1));
        map<int, Date> days = rec.daysInRange(Date(2013, 1, 1), Date(2014, 1, 1));
        map<int, Date> result;
        result[0] = Date(2013, 1, 1);
        result[1] = Date(2014, 1, 1);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeYearlyInterval) {
        Recurrence rec = Recurrence(Yearly, Date(2013, 1, 1));
        rec.setInterval(2);
        map<int, Date> days = rec.daysInRange(Date(2013, 1, 1), Date(2015, 1, 1));
        map<int, Date> result;
        result[0] = Date(2013, 1, 1);
        result[1] = Date(2015, 1, 1);
        compareMaps(&days, &result);
    }

    TEST_F(RecurrenceTest, daysInRangeYearlyByMonthDays) {
        Recurrence rec = Recurrence(Yearly, Date(2014, 1, 1));
        rec.setByMonthDay("-1");
        map<int, Date> days = rec.daysInRange(Date(2014, 1, 1), Date(2015, 1, 31));
        map<int, Date> result;
        result[0] = Date(2014, 1, 1);
        result[1] = Date(2014, 1, 31);
        result[2] = Date(2015, 1, 31);
        compareMaps(&days, &result);
    }
}
