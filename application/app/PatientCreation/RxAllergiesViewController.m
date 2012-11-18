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
@synthesize RxTableView, allergiesTableView;

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
    [self.navigationItem setTitle:@"Rx and Allergies"];
}

-(void) viewDidAppear:(BOOL)animated{
    RxDict = [CSVParser getPatient];
    allRx = [RxDict objectForKey:@"Rx"];
    allAllergies = [RxDict objectForKey:@"Allergies"];
    [self.RxTableView reloadData];
    [self.allergiesTableView reloadData];
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
    [allRx addObject:RxList];
    [self.RxTableView reloadData];
}

- (IBAction)addAllergies:(id)sender {
    NSString *allergies = [NSString stringWithFormat:@"%@%@", [allergiesItem.text stringByReplacingOccurrencesOfString:@"," withString:@";"], [allergiesReaction.text stringByReplacingOccurrencesOfString:@"," withString:@";"]];
    [allergiesList addObject: allergies];
    allergiesItem.text = nil;
    allergiesReaction.text = nil;
    [allAllergies addObject: allergiesList];
    [self.allergiesTableView reloadData];
    
}

- (IBAction)popover:(id)sender {
    RxList = [[NSMutableArray alloc] initWithObjects:RxName.text,RxDose.text, RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text, nil];
    allergiesList = [[NSMutableArray alloc] initWithObjects:allergiesItem, allergiesReaction, nil];
    [allRx addObject:RxList];
    [allAllergies addObject:allergiesList];
    
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Rx", @"Allergies", nil];
    NSMutableArray *RxInfo = [[NSMutableArray alloc] initWithObjects:[allRx componentsJoinedByString:@";"], [allAllergies componentsJoinedByString:@";"], nil];
    if ([RxInfo count] != [headers count]) {
        for (int i = [RxList count] ; i < [headers count]; i++) {
            [RxInfo addObject:@" "];
        }
    }
    RxDict = [[NSMutableDictionary alloc] initWithObjects:RxInfo forKeys:headers];
    [CSVParser saveData:RxDict];
    
}

- (IBAction)home:(id)sender {
    RxList = [[NSMutableArray alloc] initWithObjects:RxName.text,RxDose.text, RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text, nil];
    allergiesList = [[NSMutableArray alloc] initWithObjects:allergiesItem, allergiesReaction, nil];
    [allRx addObject:RxList];
    [allAllergies addObject:allergiesList];
    
    NSArray *headers = [[NSArray alloc] initWithObjects:@"Rx", @"Allergies", nil];
    NSMutableArray *RxInfo = [[NSMutableArray alloc] initWithObjects:[allRx componentsJoinedByString:@";"], [allAllergies componentsJoinedByString:@";"], nil];
    if ([RxInfo count] != [headers count]) {
        for (int i = [RxList count] ; i < [headers count]; i++) {
            [RxInfo addObject:@" "];
        }
    }
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
    if(tableView == RxTableView){
    return [allRx count];
    }
    else{
    return [allAllergies count];
}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Formal";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier:CellIdentifier];
    if (tableView == RxTableView){
        static NSString *CellIdentifier = @"Rx";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
        }
            cell.textLabel.text = [allRx objectAtIndex:indexPath.row];
    }
    else{
        static NSString *CellIdentifier = @"Allergies";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
        }
            cell.textLabel.text = [allAllergies objectAtIndex:indexPath.row];
    }


    return cell;
} 
@end
