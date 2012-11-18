//
//  SocialHistoryViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SocialHistoryViewController : UIViewController{
    IBOutlet UISegmentedControl *drugButton;
    IBOutlet UISegmentedControl *alcButton;
    NSMutableDictionary *socialHis;
}


- (IBAction)drugButton:(id)sender;
- (IBAction)alcButton:(id)sender;
- (IBAction)popover:(id)sender;
- (IBAction)home:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *otherField;
@property (weak, nonatomic) IBOutlet UITextField *drugField;
@property (weak, nonatomic) IBOutlet UITextField *alcField;
@property (weak, nonatomic) IBOutlet UILabel *drugLabel;
@property (weak, nonatomic) IBOutlet UILabel *alcLabel;

@end
