//
//  BlueToothViewController.h
//  app
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    SENDING,
    RECEIVING
} MODE;

@interface BlueToothViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * listOfFileName;
    NSArray * listOfOtherFileNames;
    NSMutableArray * filteredStrings;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *fileTable;
@property (nonatomic) MODE mode;
- (void) alert:(NSString*) msg;
- (void) setupSend;
- (void) updateOtherFileList:(NSArray*) otherFileList;
- (NSString*) getListOfFileNames;
@end
