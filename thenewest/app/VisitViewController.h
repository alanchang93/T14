//
//  VisitViewController.h
//  app
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitViewController : UIViewController<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void) getFileNameByCell: (NSString*) name;
@end
