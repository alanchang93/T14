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

-(void) viewDidAppear:(BOOL)animated{
    socialHis = [CSVParser getPatient];
    if ([socialHis objectForKey:@"Drug Use"] == @"YES"){
        drugButton.selectedSegmentIndex = 1;
    }
    if([socialHis objectForKey:@"Alcohol Use"] == @"YES"){
        alcButton.selectedSegmentIndex = 1;
    }
drugField.text = [[socialHis objectForKey:@"Drug Detail"] stringByReplacingOccurrencesOfString:@";" withString:@","];
alcField.text = [[socialHis objectForKey:@"Alcohol Detail"] stringByReplacingOccurrencesOfString:@";" withString:@","];
otherField.text = [[socialHis objectForKey:@"Other Information"] stringByReplacingOccurrencesOfString:@";" withString:@","];

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
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Drug Use", @"Drug Detail", @"Alcohol Use", @"Alcohol Detail", @"Other Information", nil];
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
    NSArray *info = [[NSArray alloc] initWithObjects: drugUse,[drugField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], alcUse, [alcField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], [otherField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    socialHis = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:socialHis];
}

- (IBAction)home:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Drug Use", @"Drug Detail", @"Alcohol Use", @"Alcohol Detail", @"Other Information", nil];
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
    NSArray *info = [[NSArray alloc] initWithObjects: drugUse,[drugField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], alcUse, [alcField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], [otherField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    socialHis = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:socialHis];
    [CSVParser writeData];
    [CSVParser clearPatient];
}
@end
