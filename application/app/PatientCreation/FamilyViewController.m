//
//  FamilyViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "FamilyViewController.h"
#import "CSVParser.h"

@interface FamilyViewController ()

@end

@implementation FamilyViewController

@synthesize familyText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated{
    FamHis = [CSVParser getPatient];
    familyText.text = [[FamHis objectForKey:@"Family History"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Family History"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)famHome:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Family History", nil];
    NSArray *FamilyHistory = [[NSArray alloc] initWithObjects:[familyText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    FamHis = [[NSMutableDictionary alloc] initWithObjects:FamilyHistory forKeys:header];
    [CSVParser saveData:FamHis];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Family History", nil];
    NSArray *FamilyHistory = [[NSArray alloc] initWithObjects:[familyText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    FamHis = [[NSMutableDictionary alloc] initWithObjects:FamilyHistory forKeys:header];
    [CSVParser saveData:FamHis];
}
@end
