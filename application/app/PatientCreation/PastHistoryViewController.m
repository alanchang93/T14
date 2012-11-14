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

@synthesize childMedical;
@synthesize adultMedical;
@synthesize childSugical;
@synthesize adultSurgical;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (IBAction)popover:(id)sender {
    NSLog(@"%@",childMedical);
    NSLog(@"%@",adultMedical);
    NSLog(@"%@",childSugical);
    NSLog(@"%@",adultSurgical);
}

- (IBAction)home:(id)sender {
    NSLog(@"%@",childMedical);
    NSLog(@"%@",adultMedical);
    NSLog(@"%@",childSugical);
    NSLog(@"%@",adultSurgical);
}
@end
