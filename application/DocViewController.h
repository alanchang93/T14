//
//  DocViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocViewController : UIViewController{
    NSMutableDictionary *docDict;
}
@property (weak, nonatomic) IBOutlet UITextField *physicianField;
@property (weak, nonatomic) IBOutlet UITextField *studentField;
- (IBAction)home:(id)sender;
- (IBAction)popover:(id)sender;
- (IBAction)save:(id)sender;

@end
