//
//  PastHistoryViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "PastHistoryViewController.h"
#import "CSVParser.h"

@interface PastHistoryViewController ()

@end


@implementation PastHistoryViewController


@synthesize childMedical, adultMedical, childSurgical, adultSurgical;

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Past History"];
}

- (void) viewDidAppear:(BOOL)animated{
    pastHistoryDict = [CSVParser getPatient];
    self.childMedical.text = [[pastHistoryDict objectForKey:@"Childhood Medical History"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.adultMedical.text = [[pastHistoryDict objectForKey:@"Adulthood Medical History"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.childSurgical.text = [[pastHistoryDict objectForKey:@"Childhood Surgical History"] stringByReplacingOccurrencesOfString: @";" withString:@","];
    self.adultSurgical.text = [[pastHistoryDict objectForKey:@"Adulthood Surgical History"] stringByReplacingOccurrencesOfString: @";" withString:@","];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PastHistoryPopover:(id)sender {
    NSMutableArray *headers = [[NSMutableArray alloc] initWithObjects:@"Childhood Medical History",@"Adulthood Medical History",@"Childhood Surgical History", @"Adulthood Surgical History", nil];
    NSMutableArray *pastHistoryInfo = [[NSMutableArray alloc] initWithObjects: self.childMedical.text, self.adultMedical.text, self.childSurgical.text, self.adultSurgical.text,nil];
    pastHistoryDict = [[NSMutableDictionary alloc] initWithObjects:pastHistoryInfo forKeys:headers];
    [CSVParser saveData:pastHistoryDict];
}

- (IBAction)PastHistoryHome:(id)sender {
    NSMutableArray *headers = [[NSMutableArray alloc] initWithObjects:@"Childhood Medical History",@"Adulthood Medical History",@"Childhood Surgical History", @"Adulthood Surgical History", nil];
    NSString *mchild = [self.childMedical.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *madult = [self.adultMedical.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *schild = [self.childSurgical.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *sadult = [self.adultSurgical.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSMutableArray *pastHistoryInfo = [[NSMutableArray alloc] initWithObjects: mchild, madult, schild, sadult,nil];
    pastHistoryDict = [[NSMutableDictionary alloc] initWithObjects:pastHistoryInfo forKeys:headers];
    [CSVParser saveData:pastHistoryDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}
@end
