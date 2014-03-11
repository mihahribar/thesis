//
//  RecurrenceTests.m
//  Thesis
//
//  Created by Miha Hribar on 05/03/14.
//  Copyright (c) 2014 Miha Hribar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ThesisRecurrence.h"

@interface RecurrenceTests : XCTestCase

@end

@implementation RecurrenceTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testInit {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    // test that start date is set to today
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    XCTAssertEqual(day, [[rec getStart] getDay]);
    XCTAssertEqual(month, [[rec getStart] getMonth]);
    XCTAssertEqual(year, [[rec getStart] getYear]);
    
    // frequency should be monthly
    XCTAssertEqual(kThesisFrequencyMonthly, [rec getFrequency]);
}

- (void)testInitWithFrequencyAndStart {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] initWithFrequency:kThesisFrequencyWeekly andStartDay:[[ThesisDate alloc] initWithYear:2014 month:2 andDay:1]];
    XCTAssertEqual(2014, [[rec getStart] getYear]);
    XCTAssertEqual(2, [[rec getStart] getMonth]);
    XCTAssertEqual(1, [[rec getStart] getDay]);
    XCTAssertEqual(kThesisFrequencyWeekly, [rec getFrequency]);
}

- (void)testSetStart {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    [rec setStart:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1]];
    XCTAssertEqual(2014, [[rec getStart] getYear]);
    XCTAssertEqual(1, [[rec getStart] getMonth]);
    XCTAssertEqual(1, [[rec getStart] getDay]);
}

- (void)testSetUntil {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    [rec setUntil:[[ThesisDate alloc] initWithYear:2018 month:12 andDay:31]];
    XCTAssertEqual(2018, [[rec getUntil] getYear]);
    XCTAssertEqual(12, [[rec getUntil] getMonth]);
    XCTAssertEqual(31, [[rec getUntil] getDay]);
}

- (void)testSetFrequency {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    [rec setFrequency:kThesisFrequencyWeekly];
    XCTAssertEqual(kThesisFrequencyWeekly, [rec getFrequency]);
}

- (void)testSetInterval {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    [rec setInterval:2];
    XCTAssertEqual(2, [rec getInterval]);
}

- (void)testSetCount {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    [rec setCount:11];
    XCTAssertEqual(11, [rec getCount]);
}

- (void)testSetByDay {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    NSString *byday = @"MO,TU";
    [rec setByDay:byday];
    XCTAssertTrue([byday isEqualToString:[rec getByDay]]);
}

- (void)testSetByMonthDay {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] init];
    NSString *bymonthday = @"1,5";
    [rec setByMonthDay:bymonthday];
    XCTAssertTrue([bymonthday isEqualToString:[rec getByMonthDay]]);
}

- (void)testDaysInRange {
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] initWithFrequency:kThesisFrequencyMonthly
                                                          andStartDay:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1]];
    [rec setByMonthDay:@"-1"];
    [rec setInterval:2];
    NSDictionary *result = [NSDictionary dictionaryWithObjectsAndKeys:
                            [[ThesisDate alloc] initWithYear:2014 month:1 andDay:1], [NSNumber numberWithInt:0],
                            [[ThesisDate alloc] initWithYear:2014 month:1 andDay:31], [NSNumber numberWithInt:1],
                            [[ThesisDate alloc] initWithYear:2014 month:3 andDay:31], [NSNumber numberWithInt:2],
                            nil];
    NSDictionary *days = [rec daysInRangeFrom:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1]
                                           to:[[ThesisDate alloc] initWithYear:2014 month:3 andDay:31]];
    for (NSString *iteration in days) {
        XCTAssertTrue([(ThesisDate *)[days objectForKey:iteration] isEqualToDate:[result objectForKey:iteration]]);
    }
}

@end
