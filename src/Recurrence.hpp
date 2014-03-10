/**
 * Recurrence.hpp
 *
 * @author Miha Hribar
 * @package thesis
 * @version 1.0
 */

#ifndef RECURRENCE_HPP_
#define RECURRENCE_HPP_

#include "Date.hpp"
#include <vector>
#include <map>
using namespace std;

namespace Thesis {
    enum Frequency {
        Daily,
        Weekly,
        Monthly,
        Yearly
    };

    class Recurrence {
        Date      start, until;
        Frequency freq;
        int       interval, count;
        string    byday;
        map<Weekday, int> weekdays;
        Weekday   wkst;
        string    bymonthday;
        int       iteration;
        vector<int> monthdays;

    public:
        Recurrence(Frequency freq, Date start);
        virtual ~Recurrence();

        /**
         * Calculate recurring days in from-to range.
         */
        map<int, Date> daysInRange(Date from, Date to);

        /**
         * Get start
         */
        Date getStart() const { return start; }

        /**
         * Set start
         */
        void setStart(Date date);

        /**
         * Get until
         */
        Date getUntil() const { return until; }

        /**
         * Set start
         */
        void setUntil(Date date);

        /**
         * Get frequency
         */
        Frequency getFrequency() const { return freq; }

        /**
         * Set frequency
         */
        void setFrequency(Frequency freq);

        /**
         * Get interval
         */
        int getInterval() const { return interval; }

        /**
         * Set interval
         */
        void setInterval(int interval);

        /**
         * Get count
         */
        int getCount() const { return count; }

        /**
         * Set count
         */
        void setCount(int count);

        /**
         * Get by day
         */
        string getByDay() const { return byday; }

        /**
         * Set by day
         */
        void setByDay(string byday);

        /**
         * Set by month day
         */
        void setByMonthDay(string bymonthday);

        /**
         * Get by month day
         */
        string getByMonthDay() const { return bymonthday; }

    private:
        void next(Date *date, int times);
        void adjustEnd();
        void parseByDay();
        void parseByMonthDay();
        void expandByDay(Date *date, int times);
        void expandByMonthDays(Date *date, int times);
    };

}

#endif /* RECURRENCE_HPP_ */
