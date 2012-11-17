//
//  DocViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "DocViewController.h"
#import "CSVParser.h"

@interface DocViewController ()

@end

@implementation DocViewController

@synthesize physicianField, studentField;

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

-(void) viewDidAppear:(BOOL)animated{
    docDict = [CSVParser getPatient];
    physicianField.text = [[docDict objectForKey:@"Physician"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    studentField.text = [[docDict objectForKey:@"Med Student"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Physician", @"Med Student", nil];
    NSArray *info = [[NSArray alloc] initWithObjects:[physicianField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[studentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    docDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:docDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Physician", @"Med Student", nil];
    NSArray *info = [[NSArray alloc] initWithObjects:[physicianField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[studentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    docDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:docDict];
}

- (IBAction)save:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Physician", @"Med Student", nil];
    NSArray *info = [[NSArray alloc] initWithObjects:[physicianField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[studentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    docDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:docDict];
}
@end
