//
//  CCHPIViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "CCHPIViewController.h"
#import "CSVParser.h"

@interface CCHPIViewController ()

@end

@implementation CCHPIViewController

@synthesize CCText;
@synthesize HPIText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"CC & HPI"];
}

- (void) viewDidAppear:(BOOL)animated{
    CCHPI = [CSVParser getPatient];
    self.CCText.text = [[CCHPI objectForKey:@"CC"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.HPIText.text = [[CCHPI objectForKey:@"HPI"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popover:(id)sender {
    NSMutableArray *headers = [[NSMutableArray alloc] initWithObjects: @"CC",@"HPI", nil];
    NSMutableArray *CCinfo = [[NSMutableArray alloc] initWithObjects: self.CCText.text, self.HPIText.text, nil];
    CCHPI = [[NSMutableDictionary alloc] initWithObjects:CCinfo forKeys:headers];
    [CSVParser saveData:CCHPI];
}

- (IBAction)home:(id)sender {
    NSMutableArray *headers = [[NSMutableArray alloc] initWithObjects: @"CC",@"HPI",nil];
    NSMutableArray *CCinfo = [[NSMutableArray alloc] initWithObjects: [self.CCText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], [self.HPIText.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    CCHPI = [[NSMutableDictionary alloc] initWithObjects:CCinfo forKeys:headers];
    [CSVParser saveData:CCHPI];
    [CSVParser writeData];
    [CSVParser clearPatient];
}


@end
