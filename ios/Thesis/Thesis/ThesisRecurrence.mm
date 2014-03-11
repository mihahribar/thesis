//
//  ThesisRecurrence.m
//  Thesis
//
//  Created by Miha Hribar on 05/03/14.
//  Copyright (c) 2014 Miha Hribar. All rights reserved.
//

#import "ThesisRecurrence.h"
#import "Recurrence.hpp"
#import "Date.hpp"

@interface ThesisRecurrence() {
    Thesis::Recurrence *wrapped;
}
@end

@implementation ThesisRecurrence

- (ThesisRecurrence *)init {
    return [self initWithFrequency:kThesisFrequencyMonthly
                       andStartDay:[[ThesisDate alloc] init]];
}

- (ThesisRecurrence *)initWithFrequency:(ThesisFrequency)frequency andStartDay:(ThesisDate *)start {
    self = [super init];
    if (self) {
        wrapped = new Thesis::Recurrence((Thesis::Frequency)frequency,
                                        Thesis::Date([start getYear], [start getMonth], [start getDay]));
        if (!wrapped) self = nil;
    }
    return self;
}

- (void)dealloc {
    delete wrapped;
}

- (ThesisDate *)convertFromDate:(Thesis::Date)date {
    return [[ThesisDate alloc] initWithYear:date.getYear()
                                     month:date.getMonth()
                                    andDay:date.getDay()];
}

- (NSString *)convertFromString:(std::string)str {
    return [NSString stringWithCString:str.c_str() encoding:[NSString defaultCStringEncoding]];
}

- (ThesisDate *)getStart {
    return [self convertFromDate:wrapped->getStart()];
}

- (ThesisDate *)getUntil {
    return [self convertFromDate:wrapped->getUntil()];
}

- (ThesisFrequency)getFrequency {
    return (ThesisFrequency)wrapped->getFrequency();
}

- (NSInteger)getInterval {
    return wrapped->getInterval();
}

- (NSInteger)getCount {
    return wrapped->getCount();
}

- (NSString *)getByDay {
    return [self convertFromString:wrapped->getByDay()];
}

- (NSString *)getByMonthDay {
    return [self convertFromString:wrapped->getByMonthDay()];
}

- (void)setStart:(ThesisDate *)start {
    wrapped->setStart(Thesis::Date([start getYear], [start getMonth], [start getDay]));
}

- (void)setUntil:(ThesisDate *)until {
    wrapped->setUntil(Thesis::Date([until getYear], [until getMonth], [until getDay]));
}

- (void)setFrequency:(ThesisFrequency)frequency {
    wrapped->setFrequency((Thesis::Frequency)frequency);
}

- (void)setInterval:(NSInteger)interval {
    wrapped->setInterval(interval);
}

- (void)setCount:(NSInteger)count {
    wrapped->setCount(count);
}

- (void)setByDay:(NSString *)byday {
    std::string str([byday UTF8String]);
    wrapped->setByDay(str);
}

- (void)setByMonthDay:(NSString *)bymonthday {
    std::string str([bymonthday UTF8String]);
    wrapped->setByMonthDay(str);
}

- (NSDictionary *)daysInRangeFrom:(ThesisDate *)from to:(ThesisDate *)to {
    NSMutableDictionary *days = [[NSMutableDictionary alloc] init];
    
    map<int, Thesis::Date> result = wrapped->daysInRange(Thesis::Date([from getYear], [from getMonth], [from getDay]), Thesis::Date([to getYear], [to getMonth], [to getDay]));
    
    for(map<int, Thesis::Date>::iterator it = result.begin(); it != result.end(); it++) {
        int iteration = it->first;
        Thesis::Date day = it->second;
        
        [days setObject:[self convertFromDate:day] forKey:[NSNumber numberWithInt:iteration]];
    }
    
    return days;
}

@end
