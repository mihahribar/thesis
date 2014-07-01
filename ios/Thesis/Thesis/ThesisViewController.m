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
{
    NSDateFormatter *dateFormatter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ThesisDate *date = [[ThesisDate alloc] initWithYear:2014 month:7 andDay:1];
    ThesisRecurrence *recurrence = [[ThesisRecurrence alloc] initWithFrequency:kThesisFrequencyWeekly andStartDay:date];
    ThesisDate *end = [[ThesisDate alloc] initWithYear:2014 month:9 andDay:30];
    self.dates = [recurrence daysInRangeFrom:date to:end];
    self.iterations = [self.dates allKeys];
    self.iterations = [self.iterations sortedArrayUsingComparator:^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)checkForMemoryLeaks
{
    // generate a bunch of items and check for memory leaks
    NSLog(@"start");
    ThesisRecurrence *rec = [[ThesisRecurrence alloc] initWithFrequency:kThesisFrequencyDaily
                                                          andStartDay:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1]];
    NSDictionary *result = [rec daysInRangeFrom:[[ThesisDate alloc] initWithYear:2014 month:1 andDay:1] to:[[ThesisDate alloc] initWithYear:2018 month:1 andDay:1]];
    NSLog(@"days %lu", (unsigned long)[result count]);
    NSLog(@"done");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
    }
    
    NSNumber *iteration = [self.iterations objectAtIndex:indexPath.row];
    NSDate *date = [self getDateFromIndexPath:indexPath];
    cell.textLabel.text = [dateFormatter stringFromDate:date];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d. sestanek", [iteration intValue]+1];
    return cell;
}

- (NSDate *)getDateFromIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *iteration = [self.iterations objectAtIndex:indexPath.row];
    ThesisDate *date = [self.dates objectForKey:iteration];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[date getDay]];
    [components setMonth:[date getMonth]];
    [components setYear:[date getYear]];
    return [calendar dateFromComponents:components];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // send email
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *ics = [NSString stringWithFormat:@"BEGIN:VCALENDAR\n"
                         "METHOD:PUBLISH\n"
                         "VERSION:2.0\n"
                         "BEGIN:VEVENT\n"
                         "CREATED:20140701T165040Z\n"
                         "DTEND;TZID=Europe/Ljubljana:20140716T100000\n"
                         "SUMMARY:Sestanek\n"
                         "DTSTART;TZID=Europe/Ljubljana:20140716T090000\n"
                         "DTSTAMP:20140701T165049Z\n"
                         "SEQUENCE:2\n"
                         "END:VEVENT\n"
                         "END:VCALENDAR\n"];
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Pridi na sestanek"];
        NSString *body = [NSString stringWithFormat:@"Zdravo, prid na sestanek %@.", [dateFormatter stringFromDate:[self getDateFromIndexPath:indexPath]]];
        [mailViewController setMessageBody:body isHTML:NO];
        [mailViewController addAttachmentData:[ics dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"text/calendar" fileName:@"sestanek.ics"];
        [self presentViewController:mailViewController animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"Cant send emails from this device");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
