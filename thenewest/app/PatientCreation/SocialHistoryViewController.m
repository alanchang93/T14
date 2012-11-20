//
//  SocialHistoryViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "SocialHistoryViewController.h"
#import "CSVParser.h"

@interface SocialHistoryViewController ()

@end

@implementation SocialHistoryViewController

@synthesize drugField, drugLabel, alcField, alcLabel, otherField, tabacField, tobLabel;

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
    [self.navigationItem setTitle:@"Social History"];
	// Do any additional setup after loading the view.
    [otherField.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [otherField.layer setBorderWidth:1];
    [otherField.layer setCornerRadius:5];
}


-(void) viewDidAppear:(BOOL)animated{
    socialHis = [CSVParser getPatient];
    if ([socialHis objectForKey:@"Drug Use"] == @"YES"){
        drugButton.selectedSegmentIndex = 1;
    }
    if([socialHis objectForKey:@"Alcohol Use"] == @"YES"){
        alcButton.selectedSegmentIndex = 1;
    }
    if([socialHis objectForKey:@"Tobacco Use"] == @"YES"){
        tobButton.selectedSegmentIndex = 1;
    }
    drugField.text = [[socialHis objectForKey:@"Drug Detail"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    alcField.text = [[socialHis objectForKey:@"Alcohol Detail"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    tabacField.text = [[socialHis objectForKey:@"Tobacco Detail"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    otherField.text = [[socialHis objectForKey:@"Other Information"] stringByReplacingOccurrencesOfString:@";" withString:@","];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tobButton:(id)sender {
    if (tobButton.selectedSegmentIndex ==1){
        tabacField.hidden = NO;
        tobLabel.hidden = NO;
    }
    else{
        tabacField.hidden = YES;
        tobLabel.hidden = YES;
    }
}

- (IBAction)drugButton:(id)sender {
    if (drugButton.selectedSegmentIndex == 1) {
        drugField.hidden = NO;
        drugLabel.hidden = NO;
    }
    else{
        drugField.hidden = YES;
        drugLabel.hidden = YES;
    }
}

-(void) viewDidUnload
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)alcButton:(id)sender {
    if (alcButton.selectedSegmentIndex == 1){
        alcField.hidden = NO;
        alcLabel.hidden = NO;
    }
    else{
        alcField.hidden = YES;
        alcLabel.hidden = YES;
    }
}
- (IBAction)popover:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Drug Use", @"Drug Detail", @"Alcohol Use", @"Alcohol Detail",@"Tobacco Use", @"Tobacco Detail", @"Other Information", nil];
    NSString *drugUse;
    if (drugButton.selectedSegmentIndex == 1) {
        drugUse = @"YES";
    }
    else{
        drugUse = @"NO";
    }
    NSString *alcUse;
    if(alcButton.selectedSegmentIndex == 1){
        alcUse =@"YES";
    }
    else{
        alcUse = @"NO";
    }
    NSString *tobUse;
    if(tobButton.selectedSegmentIndex ==1){
        tobUse = @"YES";
    }
    else{
        tobUse = @"NO";
    }
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects: drugUse,[drugField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], alcUse, [alcField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], tobUse, [tabacField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[otherField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [headers count]) {
        for (int i = [info count] ; i < [headers count]; i++) {
            [info addObject:@" "];
        }
    }

    socialHis = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:socialHis];
}

- (IBAction)home:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Drug Use", @"Drug Detail", @"Alcohol Use", @"Alcohol Detail",@"Tobacco Use", @"Tobacco Detail", @"Other Information", nil];
    NSString *drugUse;
    if (drugButton.selectedSegmentIndex == 1) {
        drugUse = @"YES";
    }
    else{
        drugUse = @"NO";
    }
    NSString *alcUse;
    if(alcButton.selectedSegmentIndex == 1){
        alcUse =@"YES";
    }
    else{
        alcUse = @"NO";
    }
    NSString *tobUse;
    if(tobButton.selectedSegmentIndex ==1){
        tobUse = @"YES";
    }
    else{
        tobUse = @"NO";
    }
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects: drugUse,[drugField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], alcUse, [alcField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], tobUse, [tabacField.text stringByReplacingOccurrencesOfString:@"," withString:@";"],[otherField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [headers count]) {
        for (int i = [info count] ; i < [headers count]; i++) {
            [info addObject:@" "];
        }
    }
    socialHis = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:socialHis];
    [CSVParser writeData];
    [CSVParser clearPatient];
}
@end
