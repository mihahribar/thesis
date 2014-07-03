//
//  ThesisViewController.h
//  Thesis
//
//  Created by Miha Hribar on 17/12/13.
//  Copyright (c) 2013 Miha Hribar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ThesisViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>

- (IBAction)checkForMemoryLeaks;
- (IBAction)runForPerformance;

@property (nonatomic, retain) NSDictionary *dates;
@property (nonatomic, retain) NSArray *iterations;

@end
