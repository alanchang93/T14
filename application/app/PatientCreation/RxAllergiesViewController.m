//
//  RxAllergiesViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "RxAllergiesViewController.h"
#import "CSVParser.h"

@interface RxAllergiesViewController ()

@end

@implementation RxAllergiesViewController

@synthesize RxName, RxDose, RxRoute, RxFreq, RxStarted, RxEnded, allergiesItem, allergiesReaction;

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
    RxList = [[NSMutableArray alloc] init];
}

-(void) viewDidAppear:(BOOL)animated{
    RxDict = [CSVParser getPatient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addRx:(id)sender {
    NSString *Rx = [NSString stringWithFormat:@"%@%@%@%@%@%@", RxName.text,RxDose.text,RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text];
    [RxList addObject: Rx];
    RxName.text = nil;
    RxDose.text = nil;
    RxRoute.text = nil;
    RxFreq.text = nil;
    RxStarted.text = nil;
    RxEnded.text = nil;
    NSLog(@"%@", RxList);
    [mainTableView reloadData];
}

- (IBAction)addAllergies:(id)sender {
}

- (IBAction)popover:(id)sender {
    RxList = [[NSMutableArray alloc] initWithObjects:RxName.text,RxDose.text, RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text, nil];
    allergiesList = [[NSMutableArray alloc] initWithObjects:allergiesItem, allergiesReaction, nil];
    
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Rx", @"Allergies", nil];
    NSArray *RxInfo = [[NSArray alloc] initWithObjects:[RxList componentsJoinedByString:@";"], [allergiesList componentsJoinedByString:@";"], nil];
    RxDict = [[NSMutableDictionary alloc] initWithObjects:RxInfo forKeys:headers];
    [CSVParser saveData:RxDict];
    
}

- (IBAction)home:(id)sender {
    RxList = [[NSMutableArray alloc] initWithObjects:RxName.text,RxDose.text, RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text, nil];
    allergiesList = [[NSMutableArray alloc] initWithObjects:allergiesItem, allergiesReaction, nil];
    
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Rx", @"Allergies", nil];
    NSArray *RxInfo = [[NSArray alloc] initWithObjects:[RxList componentsJoinedByString:@";"], [allergiesList componentsJoinedByString:@";"], nil];
    RxDict = [[NSMutableDictionary alloc] initWithObjects:RxInfo forKeys:headers];
    [CSVParser saveData:RxDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%u", [RxList count]);
    return [RxList count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Formal";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    
    cell.textLabel.text = [RxList objectAtIndex:indexPath.row];
    
    return cell;
} 
@end
