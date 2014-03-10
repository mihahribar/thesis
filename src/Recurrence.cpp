/**
 * Recurrence.cpp
 *
 * @author Miha Hribar
 * @package thesis
 * @version 1.0
 */

#include "Recurrence.hpp"
#include <iostream>
#include <sstream>
#include <algorithm>
#include <cstdlib>

namespace Thesis {

    Recurrence::Recurrence(Frequency f, Date s): freq(f), start(s), interval(1), count(0),
                                                 until(Date(9999, 1, 1)), byday(""), bymonthday(""),
                                                 wkst(Monday), iteration(0) {
    }

    Recurrence::~Recurrence() {
    }

    map<int, Date> Recurrence::daysInRange(Date from, Date to) {
        iteration = 0; // don't forget to reset iteration each time
        map<int, Date> days;
        Date repeat = start;
        do {
            if (!repeat.isBefore(from) && !repeat.isAfter(to)) {
                days[iteration] = repeat;
            }

            next(&repeat, interval);
            iteration++;
        } while (((count > 0 && iteration != count) || count == 0) && !repeat.isAfter(to) && !repeat.isAfter(until));

        return days;
    }

    void Recurrence::next(Date *date, int times) {
        // add interval*frequency
        if (freq == Daily) {
            date->addDays(times);
        }
        else if (freq == Weekly) {
            if (weekdays.size()) {
                expandByDay(date, times);
            }
            else {
                date->addDays(times*7);
            }
        }
        else if (freq == Monthly) {
            if (weekdays.size()) {
                expandByDay(date, times);
            }
            else if (monthdays.size()) {
                expandByMonthDays(date, times);
            }
            else {
                date->addMonths(times);
            }
        }
        else if (freq == Yearly) {
            if (monthdays.size()) {
                expandByMonthDays(date, times);
            }
            else {
                date->addYears(times);
            }
        }
    }

    void Recurrence::setFrequency(Frequency f) {
        freq = f;
    }

    void Recurrence::setStart(Date s) {
        start = s;
    }

    void Recurrence::setInterval(int i) {
        interval = i;
    }

    void Recurrence::setCount(int c) {
        count = c;
    }

    void Recurrence::setUntil(Date u) {
        until = u;
    }

    void Recurrence::setByDay(string days) {
        byday = days;
        parseByDay();
    }

    void Recurrence::setByMonthDay(string days) {
        bymonthday = days;
        parseByMonthDay();
    }

    void Recurrence::parseByDay() {
        // trim space
        byday.erase(std::remove(byday.begin(), byday.end(), ' '), byday.end());
        if (!byday.empty()) {
            if (weekdays.size()) {
                // empty days
                weekdays.clear();
            }

            // explode string
            std::istringstream iss(byday);
            for (std::string token; std::getline(iss, token, ',');) {
                if (!token.empty()) {
                    Weekday day;
                    if (token.compare("SU") == 0) {
                        day = Sunday;
                    }
                    else if (token.compare("MO") == 0) {
                        day = Monday;
                    }
                    else if (token.compare("TU") == 0) {
                        day = Tuesday;
                    }
                    else if (token.compare("WE") == 0) {
                        day = Wednesday;
                    }
                    else if (token.compare("TH") == 0) {
                        day = Thursday;
                    }
                    else if (token.compare("FR") == 0) {
                        day = Friday;
                    }
                    else if (token.compare("SA") == 0) {
                        day = Saturday;
                    }
                    else {
                        continue;
                    }
                    weekdays[day] = 0;
                }
            }
        }
    }

    void Recurrence::parseByMonthDay() {
        // trim space
        bymonthday.erase(std::remove(bymonthday.begin(), bymonthday.end(), ' '), bymonthday.end());
        if (!bymonthday.empty()) {
            if (monthdays.size()) {
                // empty days
                monthdays.clear();
            }

            // explode string
            std::istringstream iss(bymonthday);
            for (std::string token; std::getline(iss, token, ',');) {
                if (!token.empty()) {
                    int day = atoi(token.c_str());
                    if (day >= -31 && day != 0 && day <= 31) {
                        monthdays.push_back(day);
                    }
                }
            }

            // sort days ascending
            std::sort(monthdays.begin(), monthdays.end());
        }
    }

    void Recurrence::expandByDay(Date *date, int times) {
        map<Weekday, int>::iterator it;
        do {
            if (freq == Weekly && times > 1 && date->getWeekday() == Sunday) {
                // skip interval
                date->addDays((times-1)*7);
            }
            if (freq == Monthly && times > 1 && date->isLastDay()) {
                date->addMonths(times);
                date->setDay(1);
                date->addDays(-1);
            }
            date->addDays(1);
            it = weekdays.find(date->getWeekday());
        } while (it == weekdays.end());
    }

    void Recurrence::expandByMonthDays(Date *date, int times) {
        bool found = false;
        Date next = Date(date->getYear(), date->getMonth(), date->getDay());
        int day = date->getDay();
        int delta = 31;
        for(std::vector<int>::iterator it = monthdays.begin(); it != monthdays.end(); ++it) {
            next.setDay((int)*it);
            if (*it > 28 && *it != next.getDay() && !found) {
                continue;
            }
            // always set next day as the one with the smallest delta (-1, -2 are sorted lower, but can be larger)
            // -1 is last day of the month, -2 second to last day etc.
            // have to always loop all available month days to get the correct one
            if (next.getDay() > date->getDay() && next.getDay() - date->getDay() < delta) {
                day = next.getDay();
                delta = next.getDay() - date->getDay();
                found = true;
            }
        }

        if (found) {
            date->setDay(day);
        }
        else {
            // go to next month/year
            if (freq == Monthly) {
                date->addMonths(times);
            }
            else if (freq == Yearly) {
                date->addYears(times);
            }

            // find earliest day
            next.setDate(date->getYear(), date->getMonth(), date->getDay());
            int set = false;
            for(std::vector<int>::iterator it = monthdays.begin(); it != monthdays.end(); ++it) {
                next.setDay((int)*it);
                if (date->isAfter(next) || !set) {
                    date->setDay(next.getDay());
                    if (*it > 28 && date->getDay() != *it) {
                        date->setDay(1);
                        expandByMonthDays(date, times);
                        break;
                    }
                    set = true; // have to set at least once
                }
            }
        }
    }
}
