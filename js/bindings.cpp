#include "emscripten/bind.h"
#include "src/Date.hpp"

using namespace emscripten;

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
        ;
}
