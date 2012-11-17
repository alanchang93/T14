//
//  AssessmentViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "AssessmentViewController.h"
#import "CSVParser.h"

@interface AssessmentViewController ()

@end

@implementation AssessmentViewController

@synthesize RxField, noteField;

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
    assessmentDict = [CSVParser getPatient];
    RxField.text = [[assessmentDict objectForKey:@"Rx"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    noteField.text = [[assessmentDict objectForKey:@"notes"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Rx",@"notes", nil];
    NSArray *info = [[NSArray alloc] initWithObjects:[RxField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    assessmentDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:assessmentDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Rx",@"notes", nil];
    NSArray *info = [[NSArray alloc] initWithObjects:[RxField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    assessmentDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:assessmentDict];
    [CSVParser writeData];
}
@end
