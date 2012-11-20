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

@synthesize RxName, RxDose, RxRoute, RxFreq, RxStarted, RxEnded, alleragiesItem, allergiesReaction;
@synthesize RxTableView, AllergiesTableView;

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
    
    RxTableView.layer.borderWidth = 1.0;
    RxTableView.layer.borderColor = [UIColor grayColor].CGColor;
    RxTableView.layer.cornerRadius = 5;
    
    AllergiesTableView.layer.borderWidth = 1.0;
    AllergiesTableView.layer.borderColor = [UIColor grayColor].CGColor;
    AllergiesTableView.layer.cornerRadius = 5;
}

-(void) viewDidUnload
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) viewDidAppear:(BOOL)animated{
    RxDict = [CSVParser getPatient];
    //allRx = [RxDict objectForKey:@"Rx"];
    allRx = [[NSMutableArray alloc]init]; // Might Need to CHANGE THIS FOR EMPTY?
    allAllergies = [[NSMutableArray alloc]init];
    RxList = [[NSMutableArray alloc]init];
    allergiesList = [[NSMutableArray alloc]init];
    [self.RxTableView reloadData];
    [self.AllergiesTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addRx:(id)sender {
    NSString *Rx = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", RxName.text,@"               ",RxDose.text, @"          ",RxRoute.text,@"          ", RxFreq.text,@"          ", RxStarted.text,@"          ", RxEnded.text];
    [RxList addObject: Rx];
    RxName.text = nil;
    RxDose.text = nil;
    RxRoute.text = nil;
    RxFreq.text = nil;
    RxStarted.text = nil;
    RxEnded.text = nil;
    [allRx addObjectsFromArray:RxList];
    RxList = [[NSMutableArray alloc] init]; // Makes sure its empty again
    [self.RxTableView reloadData];
}

- (IBAction)addAllergies:(id)sender {
    NSString *allergies = [NSString stringWithFormat:@"%@%@%@", [alleragiesItem.text stringByReplacingOccurrencesOfString:@"," withString:@";"],@"           ",[allergiesReaction.text stringByReplacingOccurrencesOfString:@"," withString:@";"]];
    [allergiesList addObject: allergies];
    alleragiesItem.text = nil;
    allergiesReaction.text = nil;
    [allAllergies addObjectsFromArray:allergiesList];
    allergiesList = [[NSMutableArray alloc] init];
    [self.AllergiesTableView reloadData];
}

- (IBAction)popover:(id)sender {
    RxList = [[NSMutableArray alloc] initWithObjects:RxName.text,RxDose.text, RxRoute.text, RxFreq.text, RxStarted.text, RxEnded.text, nil];
    allergiesList = [[NSMutableArray alloc] initWithObjects:alleragiesItem, allergiesReaction, nil];
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
    allergiesList = [[NSMutableArray alloc] initWithObjects:alleragiesItem, allergiesReaction, nil];
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
        //return [allRx count];
        return [allRx count];
    }
    else{
        //return [allAllergies count];
        return [allAllergies count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == RxTableView){
        static NSString *CellIdentifier = @"Rx";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = [allRx objectAtIndex:indexPath.row];
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"Allergies";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                       reuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = [allAllergies objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        return cell;
    }
    
    
    //return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [[cell textLabel] setFont:[UIFont systemFontOfSize:12.0]];
}
@end
