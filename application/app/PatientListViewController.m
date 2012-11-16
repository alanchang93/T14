//
//  PatientListViewController.m
//  app
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "PatientListViewController.h"
#import "CSVParser.h"

@interface PatientListViewController ()
{
    NSMutableArray *totalStrings;
    NSMutableArray *filteredStrings;
    NSMutableDictionary *contentOfFile;
    BOOL isFiltered;
}

@end

@implementation PatientListViewController

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
    self.mySearchBar.delegate = self;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    totalStrings = [CSVParser getFileNames];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0)
    {
        isFiltered = NO;
    }
    else{
        isFiltered = YES;
        filteredStrings = [[NSMutableArray alloc]init];
        
        for (NSString *str in totalStrings) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(stringRange.location != NSNotFound){
                [filteredStrings addObject:str];
            }
        }
    }
    [self.myTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.mySearchBar resignFirstResponder ];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"patient";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (!isFiltered) {
        cell.textLabel.text = [totalStrings objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [filteredStrings objectAtIndex:indexPath.row];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isFiltered) {
        return [filteredStrings count];
    }
    return [totalStrings count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:cellText];
    [CSVParser loadDataFromFile: filePath];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
