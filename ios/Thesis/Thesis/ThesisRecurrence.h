//
//  ThesisRecurrence.h
//  Thesis
//
//  Created by Miha Hribar on 05/03/14.
//  Copyright (c) 2014 Miha Hribar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThesisDate.h"

typedef enum {
    kThesisFrequencyDaily,
    kThesisFrequencyWeekly,
    kThesisFrequencyMonthly,
    kThesisFrequencyYearly
} ThesisFrequency;

@interface ThesisRecurrence : NSObject

- (ThesisRecurrence *)init;
- (ThesisRecurrence *)initWithFrequency:(ThesisFrequency)frequency andStartDay:(ThesisDate *)start;

- (ThesisDate *)getStart;
- (ThesisDate *)getUntil;
- (ThesisFrequency)getFrequency;
- (NSInteger)getInterval;
- (NSInteger)getCount;
- (NSString *)getByDay;
- (NSString *)getByMonthDay;

- (void)setStart:(ThesisDate *)start;
- (void)setUntil:(ThesisDate *)until;
- (void)setFrequency:(ThesisFrequency)frequency;
- (void)setInterval:(NSInteger)interval;
- (void)setCount:(NSInteger)count;
- (void)setByDay:(NSString *)byday;
- (void)setByMonthDay:(NSString *)bymonthday;

- (NSDictionary *)daysInRangeFrom:(ThesisDate *)from to:(ThesisDate *)to;

@end
