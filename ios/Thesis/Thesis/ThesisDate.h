//
//  ThesisDate.h
//  Thesis
//
//  Created by Miha Hribar on 17/12/13.
//  Copyright (c) 2013 Miha Hribar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThesisDate : NSObject

- (ThesisDate *)init;
- (ThesisDate *)initWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;

- (NSString *)toString;
- (void)setDateWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;
- (void)setYear:(NSInteger)year;
- (void)setMonth:(NSInteger)month;
- (void)setDay:(NSInteger)day;
- (NSInteger)getYear;
- (NSInteger)getMonth;
- (NSInteger)getDay;
- (void)addDays:(NSInteger)days;
- (void)addMonths:(NSInteger)months;
- (void)addYears:(NSInteger)years;
- (BOOL)isBefore:(ThesisDate *)date;
- (BOOL)isAfter:(ThesisDate *)date;
- (BOOL)isEqualToDate:(ThesisDate *)date;

@end
