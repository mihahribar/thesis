//
//  ThesisDate.m
//  Thesis
//
//  Created by Miha Hribar on 17/12/13.
//  Copyright (c) 2013 Miha Hribar. All rights reserved.
//

#import "ThesisDate.h"
#import "Date.hpp"

@interface ThesisDate() {
    Thesis::Date* wrapped;
}
@end

@implementation ThesisDate

- (ThesisDate *)init
{
    // by default init to today
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    return [self initWithYear:year month:month andDay:day];
}

- (ThesisDate *)initWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day
{
    self = [super init];
    if (self) {
        wrapped = new Thesis::Date(year, month, day);
        if (!wrapped) self = nil;
    }
    return self;
}

- (void)dealloc
{
    delete wrapped;
}

- (NSString *)toString
{
    std::string str = wrapped->toString();
    return [NSString stringWithCString:str.c_str() encoding:[NSString defaultCStringEncoding]];
}

- (void)addDays:(NSInteger)days
{
    wrapped->addDays(days);
}

- (void)addMonths:(NSInteger)months
{
    wrapped->addMonths(months);
}

- (void)addYears:(NSInteger)years
{
    wrapped->addYears(years);
}

- (void)setDateWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day
{
    wrapped->setDate(year, month, day);
}

- (void)setYear:(NSInteger)year
{
    wrapped->setYear(year);
}

- (void)setMonth:(NSInteger)month
{
    wrapped->setMonth(month);
}

- (void)setDay:(NSInteger)day
{
    wrapped->setDay(day);
}

- (NSInteger)getYear
{
    return wrapped->getYear();
}

- (NSInteger)getMonth
{
    return wrapped->getMonth();
}

- (NSInteger)getDay
{
    return wrapped->getDay();
}

- (BOOL)isBefore:(ThesisDate *)date
{
    return wrapped->isBefore(Thesis::Date([date getYear], [date getMonth], [date getDay]));
}

- (BOOL)isAfter:(ThesisDate *)date
{
    return wrapped->isAfter(Thesis::Date([date getYear], [date getMonth], [date getDay]));
}

- (BOOL)isEqualToDate:(ThesisDate *)date {
    return wrapped->isEqual(Thesis::Date([date getYear], [date getMonth], [date getDay]));
}

@end
