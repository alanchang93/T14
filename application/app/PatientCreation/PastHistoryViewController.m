//
//  PastHistoryViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "PastHistoryViewController.h"

@interface PastHistoryViewController ()

@end


@implementation PastHistoryViewController


@synthesize childMedical, adultMedical, childSurgical, adultSurgical;

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PastHistoryPopover:(id)sender {
    NSLog(@"%@", childMedical.text);
    NSLog(@"%@", adultMedical.text);
    NSLog(@"%@", childSurgical.text);
    NSLog(@"%@", adultMedical.text);
}

- (IBAction)PastHistoryHome:(id)sender {
    NSLog(@"%@", childMedical.text);
    NSLog(@"%@", adultMedical.text);
    NSLog(@"%@", childSurgical.text);
    NSLog(@"%@", adultMedical.text);
}
@end
