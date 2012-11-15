//
//  SocialHistoryViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "SocialHistoryViewController.h"

@interface SocialHistoryViewController ()

@end

@implementation SocialHistoryViewController

@synthesize drugField, drugLabel, alcField, alcLabel, otherField;

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

- (IBAction)drugButton:(id)sender {
    if (drugButton.selectedSegmentIndex == 1) {
        NSLog(@"hi");
        drugField.hidden = NO;
        drugLabel.hidden = NO;
    }
    else{
        drugField.hidden = YES;
        drugLabel.hidden = YES;
    }
}

- (IBAction)alcButton:(id)sender {
    if (alcButton.selectedSegmentIndex == 1){
        NSLog(@"hey");
        alcField.hidden = NO;
        alcLabel.hidden = NO;
    }
    else{
        alcField.hidden = YES;
        alcLabel.hidden = YES;
    }
}
- (IBAction)popover:(id)sender {
    NSLog(@"%@%@%@", drugField, alcField, otherField);
}

- (IBAction)home:(id)sender {
    NSLog(@"%@%@%@", drugField, alcField, otherField);
}
@end
