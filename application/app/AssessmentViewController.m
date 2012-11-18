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
    [self.navigationItem setTitle: @"Assessment & Plan"];
	// Do any additional setup after loading the view.
    [noteField.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [noteField.layer setBorderWidth:1];
    [noteField.layer setCornerRadius:5];
}
-(void) viewDidAppear:(BOOL)animated{
    assessmentDict = [CSVParser getPatient];
    RxField.text = [[assessmentDict objectForKey:@"prescript"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    noteField.text = [[assessmentDict objectForKey:@"notes"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"prescript",@"notes", nil];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:[RxField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [header count]) {
        for (int i = [info count] ; i < [header count]; i++) {
            [info addObject:@" "];
        }
    }
    assessmentDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:assessmentDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Rx",@"notes", nil];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:[RxField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [header count]) {
        for (int i = [info count] ; i < [header count]; i++) {
            [info addObject:@" "];
        }
    }
    assessmentDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:assessmentDict];
    [CSVParser writeData];
}
@end
