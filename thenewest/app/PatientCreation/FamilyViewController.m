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
    [familyText.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [familyText.layer setBorderWidth:1];
    [familyText.layer setCornerRadius:5];
}

- (void) viewDidUnload
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)famHome:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Family History", nil];
    NSMutableArray *FamilyHistory = [[NSMutableArray alloc] initWithObjects:[familyText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([FamilyHistory count] != [header count]) {
        for (int i = [FamilyHistory count] ; i < [header count]; i++) {
            [FamilyHistory addObject:@" "];
        }
    }
    FamHis = [[NSMutableDictionary alloc] initWithObjects:FamilyHistory forKeys:header];
    [CSVParser saveData:FamHis];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"Family History", nil];
    NSMutableArray *FamilyHistory = [[NSMutableArray alloc] initWithObjects:[familyText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([FamilyHistory count] != [header count]) {
        for (int i = [FamilyHistory count] ; i < [header count]; i++) {
            [FamilyHistory addObject:@" "];
        }
    }
    FamHis = [[NSMutableDictionary alloc] initWithObjects:FamilyHistory forKeys:header];
    [CSVParser saveData:FamHis];
}
@end
