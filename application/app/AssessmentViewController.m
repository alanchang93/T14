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

@synthesize name1,name2,name3,dose1,dose2,dose3,route1,route2,route3,freq1,freq2,freq3,noteField;
@synthesize name4, dose4,route4,freq4, name5, dose5,route5,freq5;

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
-(void) viewDidUnload
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) viewDidAppear:(BOOL)animated{
    assessmentDict = [CSVParser getPatient];
    noteField.text = [[assessmentDict objectForKey:@"notes"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *header = [[NSArray alloc] initWithObjects:@"prescript",@"notes", nil];
    NSMutableArray *Rx1 = [[NSMutableArray alloc] initWithObjects:name1.text,dose1.text,route1.text,freq1.text,nil];
    NSMutableArray *Rx2 = [[NSMutableArray alloc] initWithObjects:name2.text, dose2.text, route2.text, freq2.text,nil];
    NSMutableArray *Rx3 = [[NSMutableArray alloc] initWithObjects:name3.text,dose3.text, route3.text, freq3.text, nil];
    NSMutableArray *Rx4 = [[NSMutableArray alloc] initWithObjects:name4.text, dose4.text, route4.text, freq4.text, nil];
    NSMutableArray *Rx5 = [[NSMutableArray alloc] initWithObjects:name5.text, dose5.text, route5.text, freq5.text, nil];
    NSMutableArray *totalRx = [[NSMutableArray alloc] initWithObjects: [Rx1 componentsJoinedByString:@"."] ,[Rx2 componentsJoinedByString:@"."],[Rx3 componentsJoinedByString:@"."] ,[Rx4 componentsJoinedByString:@"."] ,[Rx5 componentsJoinedByString:@","], nil];
    NSString *RxString = [totalRx componentsJoinedByString:@";"];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:RxString,[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
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
    NSArray *header = [[NSArray alloc] initWithObjects:@"prescript",@"notes", nil];
    NSMutableArray *Rx1 = [[NSMutableArray alloc] initWithObjects:name1.text,dose1.text,route1.text,freq1.text,nil];
    NSMutableArray *Rx2 = [[NSMutableArray alloc] initWithObjects:name2.text, dose2.text, route2.text, freq2.text,nil];
    NSMutableArray *Rx3 = [[NSMutableArray alloc] initWithObjects:name3.text,dose3.text, route3.text, freq3.text, nil];
    NSMutableArray *Rx4 = [[NSMutableArray alloc] initWithObjects:name4.text, dose4.text, route4.text, freq4.text, nil];
    NSMutableArray *Rx5 = [[NSMutableArray alloc] initWithObjects:name5.text, dose5.text, route5.text, freq5.text, nil];
    
    NSMutableArray *totalRx = [[NSMutableArray alloc] initWithObjects: [Rx1 componentsJoinedByString:@"."] ,[Rx2 componentsJoinedByString:@"."],[Rx3 componentsJoinedByString:@"."] ,[Rx4 componentsJoinedByString:@"."] ,[Rx5 componentsJoinedByString:@","], nil];
    NSString *RxString = [totalRx componentsJoinedByString:@";"];
    NSMutableArray *info = [[NSMutableArray alloc] initWithObjects:RxString,[noteField.text stringByReplacingOccurrencesOfString:@"," withString:@";"], nil];
    if ([info count] != [header count]) {
        for (int i = [info count] ; i < [header count]; i++) {
            [info addObject:@" "];
        }
    }
    assessmentDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:header];
    [CSVParser saveData:assessmentDict];
}
@end
