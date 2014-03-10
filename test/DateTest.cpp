/**
 * DateTest.cpp
 *
 * @author Miha Hribar
 * @package thesis
 * @version 1.0
 */

#include "Date.hpp"
#include "gmock/gmock.h"

using testing::Eq;

namespace Thesis {
    class DateTest: public testing::Test {
    };

    TEST_F(DateTest, correctToStringFormatSimple) {
        Date date = Date(2013, 11, 29);
        ASSERT_THAT(date.toString(), Eq("2013-11-29"));
    }

    TEST_F(DateTest, correctToStringFormatZeroPad) {
        Date date = Date(2013, 1, 6);
        ASSERT_THAT(date.toString(), Eq("2013-01-06"));
    }

    TEST_F(DateTest, initInvalidMonth) {
        ASSERT_THAT(Date(2013, 13, 6).toString(), Eq("2013-12-06"));
        ASSERT_THAT(Date(2013, 0, 6).toString(), Eq("2013-01-06"));
    }

    TEST_F(DateTest, initInvalidDay) {
        ASSERT_THAT(Date(2013, 7, 32).toString(), Eq("2013-07-31"));
        ASSERT_THAT(Date(2013, 7, 0).toString(), Eq("2013-07-01"));
    }

    TEST_F(DateTest, leapYearOK) {
        ASSERT_THAT(Date(2012, 2, 29).toString(), Eq("2012-02-29"));
    }

    TEST_F(DateTest, leapYearNotOK) {
        ASSERT_THAT(Date(2013, 2, 29).toString(), Eq("2013-02-28"));
    }

    TEST_F(DateTest, addDayChangeYear) {
        Date date = Date(2013, 12, 31);
        date.addDays(1);
        ASSERT_THAT(date.toString(), Eq("2014-01-01"));
    }

    TEST_F(DateTest, addDayChangeMonth) {
        Date date = Date(2013, 11, 30);
        date.addDays(1);
        ASSERT_THAT(date.toString(), Eq("2013-12-01"));
    }

    TEST_F(DateTest, addDayChangeDay) {
        Date date = Date(2013, 11, 29);
        date.addDays(1);
        ASSERT_THAT(date.toString(), Eq("2013-11-30"));
    }

    TEST_F(DateTest, addDayMinusChangeYear) {
        Date date = Date(2014, 1, 1);
        date.addDays(-1);
        ASSERT_THAT(date.toString(), Eq("2013-12-31"));
    }

    TEST_F(DateTest, addDayMinusChangeMonth) {
        Date date = Date(2013, 12, 1);
        date.addDays(-1);
        ASSERT_THAT(date.toString(), Eq("2013-11-30"));
    }

    TEST_F(DateTest, addDayMinusChangeDay) {
        Date date = Date(2013, 12, 31);
        date.addDays(-1);
        ASSERT_THAT(date.toString(), Eq("2013-12-30"));
    }

    TEST_F(DateTest, addMonthChangeYear) {
        Date date = Date(2013, 12, 1);
        date.addMonths(1);
        ASSERT_THAT(date.toString(), Eq("2014-01-01"));
    }

    TEST_F(DateTest, addMonthChangeMonth) {
        Date date = Date(2013, 11, 1);
        date.addMonths(1);
        ASSERT_THAT(date.toString(), Eq("2013-12-01"));
    }

    TEST_F(DateTest, addMonthChangeDay) {
        Date date = Date(2013, 10, 31);
        date.addMonths(1);
        ASSERT_THAT(date.toString(), Eq("2013-11-30"));
    }

    TEST_F(DateTest, addMonthMinusChangeDay) {
        Date date = Date(2013, 12, 31);
        date.addMonths(-1);
        ASSERT_THAT(date.toString(), Eq("2013-11-30"));
    }

    TEST_F(DateTest, addMonthMinusChangeYear) {
        Date date = Date(2014, 1, 1);
        date.addMonths(-1);
        ASSERT_THAT(date.toString(), Eq("2013-12-01"));
    }

    TEST_F(DateTest, addMonthMinusChangeMonth) {
        Date date = Date(2013, 12, 1);
        date.addMonths(-1);
        ASSERT_THAT(date.toString(), Eq("2013-11-01"));
    }

    TEST_F(DateTest, addYear) {
        Date date = Date(2013, 12, 1);
        date.addYears(1);
        ASSERT_THAT(date.toString(), Eq("2014-12-01"));
    }

    TEST_F(DateTest, addYearLeap) {
        Date date = Date(2012, 2, 29);
        date.addYears(1);
        ASSERT_THAT(date.toString(), Eq("2013-02-28"));
    }

    TEST_F(DateTest, isBefore) {
        Date date = Date(2013, 11, 11);
        ASSERT_THAT(date.isBefore(Date(2013,11,12)), Eq(true));
        ASSERT_THAT(date.isBefore(Date(2013,12,1)), Eq(true));
        ASSERT_THAT(date.isBefore(Date(2012,12,1)), Eq(false));
    }

    TEST_F(DateTest, isAfter) {
        Date date = Date(2013, 11, 11);
        ASSERT_THAT(date.isAfter(Date(2013,11,12)), Eq(false));
        ASSERT_THAT(date.isAfter(Date(2012,12,1)), Eq(true));
        ASSERT_THAT(date.isAfter(Date(2013,11,10)), Eq(true));
    }

    TEST_F(DateTest, isEqual) {
        Date date = Date(2013, 11, 11);
        ASSERT_THAT(date.isEqual(Date(2013,11,12)), Eq(false));
        ASSERT_THAT(date.isEqual(Date(2013,11,11)), Eq(true));
    }

    TEST_F(DateTest, getWeekday) {
        Date date = Date(2013, 11, 11);
        ASSERT_THAT(date.getWeekday(), Eq(Monday));

        date = Date(2012, 11, 11);
        ASSERT_THAT(date.getWeekday(), Eq(Sunday));

        date = Date(2012, 6, 6);
        ASSERT_THAT(date.getWeekday(), Eq(Wednesday));

        date = Date(2000, 6, 30);
        ASSERT_THAT(date.getWeekday(), Eq(Friday));
    }

    TEST_F(DateTest, isLastDay) {
        Date date = Date(2013, 11, 11);
        ASSERT_THAT(date.isLastDay(), Eq(false));

        date = Date(2014, 2, 28);
        ASSERT_THAT(date.isLastDay(), Eq(true));

        date = Date(2016, 2, 28);
        ASSERT_THAT(date.isLastDay(), Eq(false));
    }

    TEST_F(DateTest, setNegativeDay) {
        Date date = Date(2014, 2, 19);
        date.setDay(-1);
        ASSERT_THAT(date.getDay(), Eq(28));

        date = Date(2014, 3, 19);
        date.setDay(-1);
        ASSERT_THAT(date.getDay(), Eq(31));

        date = Date(2014, 4, 19);
        date.setDay(-1);
        ASSERT_THAT(date.getDay(), Eq(30));
    }
}
