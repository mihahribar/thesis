//
//  ThesisViewController.m
//  Fibonacci
//
//  Created by Miha Hribar on 02/07/14.
//  Copyright (c) 2014 Hribar. All rights reserved.
//

#import "ThesisViewController.h"
#import "fibonacci.h"

@interface ThesisViewController ()

@end

@implementation ThesisViewController

- (IBAction)runNative {
    NSMutableArray *durations = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
        for (int j = 0; j < 10000; j++) {
            [self fibonacciNumber:1000];
        }
        NSTimeInterval duration = [NSDate timeIntervalSinceReferenceDate] - start;
        [durations addObject:[NSNumber numberWithDouble:duration]];
    }
    NSLog(@"average %f", [self average:durations]);
}

- (IBAction)runWrapper {
    NSMutableArray *durations = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
        for (int j = 0; j < 10000; j++) {
            [ThesisFibonacci generateNumber:1000];
        }
        NSTimeInterval duration = [NSDate timeIntervalSinceReferenceDate] - start;
        [durations addObject:[NSNumber numberWithDouble:duration]];
    }
    NSLog(@"average %f", [self average:durations]);
}

- (IBAction)runEmpty {
    NSMutableArray *durations = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
        for (int j = 0; j < 10000; j++) {
            [ThesisFibonacci empty];
        }
        NSTimeInterval duration = [NSDate timeIntervalSinceReferenceDate] - start;
        [durations addObject:[NSNumber numberWithDouble:duration]];
    }
    NSLog(@"average %f", [self average:durations]);
}

- (double)average:(NSArray *)numbers
{
    // loop through an array of numbers and return the average
    double sum = 0;
    for (NSNumber *num in numbers) {
        sum += [num doubleValue];
    }
    return sum/[numbers count];
}

- (NSInteger)fibonacciNumber:(NSInteger)n
{
    int j = 0, k = 1, sum = 0;
    
    for (int i = 0; i < n-1; i++)
    {
        sum = j + k;
        j = k;
        k = sum;
    }
    
    return sum;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
