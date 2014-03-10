//
//  DateTests.m
//  Thesis
//
//  Created by Miha Hribar on 24/12/13.
//  Copyright (c) 2013 Miha Hribar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ThesisDate.h"

@interface DateTests : XCTestCase

@end

@implementation DateTests

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

- (void)testInit
{
    ThesisDate *date = [[ThesisDate alloc] init];
    // test that date is set to today
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    XCTAssertEqual(day, [date getDay]);
    XCTAssertEqual(month, [date getMonth]);
    XCTAssertEqual(year, [date getYear]);
}

- (void)testInitToDate
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    XCTAssertEqual(2013, [date getYear]);
    XCTAssertEqual(12, [date getMonth]);
    XCTAssertEqual(24, [date getDay]);
}

- (void)testToString
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    XCTAssertEqualObjects([date toString], @"2013-12-24");
}

- (void)testSetDate
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date setDateWithYear:2012 month:7 andDay:7];
    XCTAssertEqualObjects([date toString], @"2012-07-07");
}

- (void)testSetYear
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date setYear:2014];
    XCTAssertEqualObjects([date toString], @"2014-12-24");
}

- (void)testSetMonth
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date setMonth:7];
    XCTAssertEqualObjects([date toString], @"2013-07-24");
}


- (void)testSetDay
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date setDay:7];
    XCTAssertEqualObjects([date toString], @"2013-12-07");
}

- (void)testGetYear
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    XCTAssertEqual(2013, [date getYear]);
}


- (void)testGetMonth
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    XCTAssertEqual(12, [date getMonth]);
}

- (void)testGetDay
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    XCTAssertEqual(24, [date getDay]);
}

- (void)testAddDays
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date addDays:7];
    XCTAssertEqualObjects([date toString], @"2013-12-31");
    [date addDays:-14];
    XCTAssertEqualObjects([date toString], @"2013-12-17");
}

- (void)testAddMonths
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date addMonths:1];
    XCTAssertEqualObjects([date toString], @"2014-01-24");
    [date addMonths:-2];
    XCTAssertEqualObjects([date toString], @"2013-11-24");
}

- (void)testAddYears
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:24];
    [date addYears:1];
    XCTAssertEqualObjects([date toString], @"2014-12-24");
    [date addYears:-2];
    XCTAssertEqualObjects([date toString], @"2012-12-24");
}

- (void)testIsBefore
{
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2013 month:12 andDay:20];
    XCTAssertTrue([date isBefore:[[ThesisDate alloc] init]]);
}

- (void)testIsAfter
{
    ThesisDate *date = [[ThesisDate alloc] init];
    XCTAssertTrue([date isAfter:[[ThesisDate alloc] initWithYear:2013 month:12 andDay:20]]);
}

@end
