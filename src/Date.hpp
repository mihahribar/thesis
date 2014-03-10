/**
 * Date.hpp
 *
 * @author Miha Hribar
 * @package thesis
 * @version 1.0
 */

#include <string>
using namespace std;

#ifndef DATE_HPP_
#define DATE_HPP_

namespace Thesis {

    enum Weekday {
        Sunday = 0,
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday
    };

    class Date {
        // Date data
        int day, month, year;
    public:
        /**
         * Constructor
         */
        Date();
        Date(int y, int m, int d);
        ~Date();

        /**
         * Set date year, month and day
         */
        void setDate(int y, int m, int d);

        /**
         * Set year. If month and day are already set the day is
         * check for validity and updated if days in that month
         * does not exist.
         */
        void setYear(int y);

        /**
         * Set month. If day is already set it is checked for
         * validity and updated if day in that month does not exist.
         */
        void setMonth(int m);

        /**
         * Set day. If day in the month is not set an error is thrown.
         */
        void setDay(int d);

        /**
         * Get year.
         */
        int getYear() const { return year; }

        /**
         * Get month.
         */
        int getMonth() const { return month; }

        /**
         * Get day
         */
        int getDay() const { return day; }

        /**
         * Add days to date. Days can be negative.
         */
        void addDays(int days);

        /**
         * Add months to date. Months can be negative.
         */
        void addMonths(int months);

        /**
         * Add years to date. Years can be negative.
         */
        void addYears(int years);

        /**
         * Format date in YYYY-MM-DD format.
         */
        string toString();

        /**
         * Is date before date
         */
        bool isBefore(Date date);

        /**
         * Is date after date
         */
        bool isAfter(Date date);

        /**
         * Are two dates equal?
         */
        bool isEqual(Date date);

        /**
         * Get weekday
         */
        Weekday getWeekday();

        /**
         * Is last day in month
         */
        bool isLastDay();

    private:
        int  daysInMonth(int m, int y);
        bool isLeapYear(int y);
        int  timestamp();
    };
}

#endif /* DATE_HPP_ */
