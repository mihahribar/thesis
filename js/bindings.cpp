#include "emscripten/bind.h"
#include "src/Date.hpp"
#include "src/Recurrence.hpp"

using namespace emscripten;
using namespace Thesis;

EMSCRIPTEN_BINDINGS(weekday) {
    enum_<Weekday>("Weekday")
        .value("Sunday", Sunday)
        .value("Monday", Monday)
        .value("Tuesday", Tuesday)
        .value("Wednesday", Wednesday)
        .value("Thursday", Thursday)
        .value("Friday",  Friday)
        .value("Saturday", Saturday)
        ;
}

EMSCRIPTEN_BINDINGS(date) {
    class_<Date>("Date")
        .constructor<int, int, int>()
        .property("year", &Date::getYear, &Date::setYear)
        .property("month", &Date::getMonth, &Date::setMonth)
        .property("day", &Date::getDay, &Date::setDay)
        .function("setDate", &Date::setDate)
        .function("addDays", &Date::addDays)
        .function("addMonths", &Date::addMonths)
        .function("addYears", &Date::addYears)
        .function("toString", &Date::toString)
        .function("isBefore", &Date::isBefore)
        .function("isAfter", &Date::isAfter)
        .function("isEqual", &Date::isEqual)
        .function("getWeekday", &Date::getWeekday)
        .function("isLastDay", &Date::isLastDay)
        ;
}

EMSCRIPTEN_BINDINGS(frequency) {
    enum_<Frequency>("Frequency")
        .value("Daily", Daily)
        .value("Weekly", Weekly)
        .value("Monthly", Monthly)
        .value("Yearly", Yearly)
        ;
}

EMSCRIPTEN_BINDINGS(recurrence) {
    class_<Recurrence>("Recurrence")
        .constructor<Frequency, Date>()
        .property("start", &Recurrence::getStart, &Recurrence::setStart)
        .property("until", &Recurrence::getUntil, &Recurrence::setUntil)
        .property("freq", &Recurrence::getFrequency, &Recurrence::setFrequency)
        .property("interval", &Recurrence::getInterval, &Recurrence::setInterval)
        .property("byday", &Recurrence::getByDay, &Recurrence::setByDay)
        .property("bymonthday", &Recurrence::getByMonthDay, &Recurrence::setByMonthDay)
        .function("daysInRange", &Recurrence::daysInRange)
        ;
}