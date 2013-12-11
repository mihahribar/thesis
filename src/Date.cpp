/**
 * Date.cpp
 *
 * @author Miha Hribar
 * @package Thesis
 */

#include "Date.hpp"


Date::Date(int y, int m, int d) {
    setDate(y, m, d);
}

Date::~Date() {
}

// sets year, month and day
void Date::setDate (int y, int m, int d)
{
    setYear(y);
    setMonth(m);
    setDay(d);
}

// set day, month and year are always already set
void Date::setDay(int d) {
    if (d < 1) {
        day = 1;
    }
    else if (d > daysInMonth(month, year)) {
        day = daysInMonth(month, year);
    }
    else {
        day = d;
    }
}

// sets month, year is always already set
void Date::setMonth(int m) {
    if (m < 1) {
        month = 1;
    }
    else if (m > 12) {
        month = 12;
    }
    else {
        month = m;
    }

    int days = daysInMonth(month, year);
    if (day > days) day = days;
}

// set year
void Date::setYear(int y) {
    year = y;
}

string Date::toString() {
    char buffer [10];
    sprintf(buffer, "%.4d-%.2d-%.2d", year, month, day);
    return buffer;
}

int Date::daysInMonth(int m, int y) {
    if (m > 12 || m < 1) {
        return 0;
    }

    const int DAYS[13] =
       /* XX JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC */
        { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

    // special case the one leap month
    if (m == 2 && isLeapYear(y)) return 29;

    return DAYS[m];
}

bool Date::isLeapYear(int y) {
   // no leap years before 1753
   if (y < 1753) return false;

   // Not a leap year if not evenly divisible by 4
   if (y % 4 != 0) return false;

   // Is a leap year if not divisible by 100
   if (y % 100 != 0) return true;

   // Is a leap year if on the quad century
   if (y % 400 == 0) return true;

   return false;
}

void Date::addDays(int days) {
    int monthDays = daysInMonth(month, year);

    // adjust down if negative
    while (days < 0) {
        day--;
        if (day == 0) {
            addMonths(-1);
            monthDays = daysInMonth(month, year);
            // last day of the new month
            day = monthDays;
        }
        days++;
    }

    // adjust up if positive
    while (days > 0) {
        day++;
        if (day > monthDays) {
            day = 1;
            addMonths(1);
            monthDays = daysInMonth(month, year);
        }
        days--;
    }
}

void Date::addMonths(int months) {
    // adjust down if negative
    while (months < 0) {
        month--;
        if (month == 0) {
            month = 12;  // last month of the new year
            addYears(-1);
        }
        months++;
    }

    // adjust up if positive
    while (months > 0) {
        month++;
        if (month > 12) {
            month = 1; // first month of the new year
            addYears(1);
        }
        months--;
    }

    // check day (if set)
    if (day > 0 && day > daysInMonth(month, year)) {
        day = daysInMonth(month, year);
    }
}

void Date::addYears(int years) {
    year += years;
    // if month and year are already set, check if days are ok
    if (day > 0 && month > 0 && day > daysInMonth(month, year)) {
        day = daysInMonth(month, year);
    }
}

int Date::timestamp() {
    return year * 10000 + month * 100 + day;
}
