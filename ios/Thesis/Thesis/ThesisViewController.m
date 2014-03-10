//
//  ThesisViewController.m
//  Thesis
//
//  Created by Miha Hribar on 17/12/13.
//  Copyright (c) 2013 Miha Hribar. All rights reserved.
//

#import "ThesisViewController.h"
#import "ThesisRecurrence.h"

@interface ThesisViewController ()

@end

@implementation ThesisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkForMemoryLeaks {
    // generate a bunch of items and check for memory leaks
    NSLog(@"start");
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] initWithFrequency:kThesisFrequencyDaily
                                                          andStartDay:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1]];
    NSDictionary *result = [rec daysInRangeFrom:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1] to:[[ThesisDate alloc] initWithYear:2018 month:1 andDay:1]];
    NSLog(@"days %lu", (unsigned long)[result count]);
    NSLog(@"done");
}

@end
