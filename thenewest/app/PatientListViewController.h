//
//  PatientListViewController.h
//  app
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VisitViewController.h"

@interface PatientListViewController : UIViewController<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
