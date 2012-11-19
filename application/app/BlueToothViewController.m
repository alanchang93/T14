//
//  BlueToothViewController.m
//  app
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "BlueToothViewController.h"
#import "Transfer.h"
#import <GameKit/GameKit.h>
#import "CSVParser.h"



@interface BlueToothViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *transferTypeControl;
//@property (nonatomic,retain) GKSession* currentSession;
@property (nonatomic) BOOL isFiltered;
@end

@implementation BlueToothViewController

//@synthesize currentSession;
@synthesize isFiltered;
@synthesize transferTypeControl;
@synthesize fileTable;
@synthesize mode;

- (void)alert:(NSString*) message
{
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    MySessionDelegate* delegate = currentSession.delegate;
    delegate.blueToothViewController = nil;
}

- (void)viewDidLoad
{
    self.searchBar.delegate = self;
    self.fileTable.delegate = self;
    self.fileTable.dataSource = self;
    [super viewDidLoad];
    if(currentSession == nil)
    {
        // Do any additional setup after loading the view.
        [self.navigationItem setTitle:@"Bluetooth Menu"];
        GKPeerPickerController* picker = [[GKPeerPickerController alloc] init];
        picker.delegate = self;
        picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
        [picker show];
    }
    else
    {
        [mySessionDelegate updateBlueToothViewController:self];
    }
    [self setupSend];
}
- (IBAction)transferTypeChanged:(id)sender {
    if([transferTypeControl selectedSegmentIndex] == 0)
    {
        [self setupSend];
    }
    else
    {
        [self sendRetrieveFileListing];
    }
}

- (void)peerPickerController:(GKPeerPickerController*) picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    currentSession = session;
    mySessionDelegate = [[MySessionDelegate alloc] initWithBlueToothViewController:self];
    currentSession.delegate = mySessionDelegate;
    [currentSession setDataReceiveHandler:mySessionDelegate withContext:nil];
    picker.delegate = nil;
    [picker dismiss];
    [self setupSend];
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController*) picker
{
    picker.delegate = nil;
}

- (void) setupSend
{
    self.mode = SENDING;
    [mySessionDelegate reloadFiles];
    [self updateTable];
}


//
// TABLE VIEW CONTROLLER DELEGATE METHODS
//

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"file";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(isFiltered)
    {
        cell.textLabel.text = [filteredStrings objectAtIndex:indexPath.row];
    }
    else
    {
        switch(self.mode)
        {
            case SENDING:
                cell.textLabel.text = [mySessionDelegate.listFileNames objectAtIndex:indexPath.row];
                break;
            case RECEIVING:
                cell.textLabel.text = [mySessionDelegate.listOtherFileNames objectAtIndex:indexPath.row];
                break;
        }
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(isFiltered)
        return [filteredStrings count];
    switch(self.mode)
    {
        case SENDING:
            return [mySessionDelegate.listFileNames count];
        case RECEIVING:
            return [mySessionDelegate.listOtherFileNames count];
    }
    return [mySessionDelegate.listFileNames count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    switch(self.mode)
    {
        case SENDING:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *dir = [paths objectAtIndex:0];
            NSString *filePath = [dir stringByAppendingPathComponent:cellText];
            NSString* fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
            Transfer* transfer = [[Transfer alloc] initWithSession:currentSession transferType:SEND_FILE];
            transfer.fileName = cellText;
            transfer.data = fileContent;
            [transfer transfer];
            break;
        }
        case RECEIVING:
        {
            Transfer* transfer = [[Transfer alloc] initWithSession:currentSession transferType:RECEIVE_FILE];
            transfer.data = cellText;
            [transfer transfer];
            break;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) sendRetrieveFileListing
{
    // send a retrieve file listing request
    self.mode = RECEIVING;
    Transfer* transfer = [[Transfer alloc] initWithSession:currentSession transferType:RECEIVE_FILE_LISTING];
    [transfer transfer];
}

- (NSString*) getListOfFileNames
{
    return [self flattenListOfFileNames:listOfFileName];
}

- (NSString*) flattenListOfFileNames:(NSMutableArray*) listOfFiles
{
    return [listOfFiles componentsJoinedByString:@";"];
}

- (void) updateTable
{
    [fileTable reloadData];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0)
    {
        isFiltered = NO;
    }
    else{
        isFiltered = YES;
        filteredStrings = [[NSMutableArray alloc] init];
        switch(self.mode)
        {
            case SENDING:
                for(NSString*str in mySessionDelegate.listFileNames)
                {
                    NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    
                    if(stringRange.location != NSNotFound){
                        [filteredStrings addObject:str];
                    }
                }
                break;
            case RECEIVING:
                for(NSString* str in mySessionDelegate.listOtherFileNames)
                {
                    NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    
                    if(stringRange.location != NSNotFound){
                        [filteredStrings addObject:str];
                    }
                }
                break;
                
        }
    }
    [fileTable reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder ];
}


@end
