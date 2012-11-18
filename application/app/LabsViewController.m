//
//  LabsViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "LabsViewController.h"
#import "CSVParser.h"

@interface LabsViewController ()

@end

@implementation LabsViewController

@synthesize textField;

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
    [self.navigationItem setTitle: @"Lab & Other"];
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    labDict = [CSVParser getPatient];
    textField.text = [[labDict objectForKey:@"Lab&Other"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Lab&Other",nil];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:[textField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [header count]) {
        for (int i = [info count] ; i < [header count]; i++) {
            [info addObject:@" "];
        }
    }
    labDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:labDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Lab&Other",nil];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:[textField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [header count]) {
        for (int i = [info count] ; i < [header count]; i++) {
            [info addObject:@" "];
        }
    }
    labDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:labDict];
}
@end
