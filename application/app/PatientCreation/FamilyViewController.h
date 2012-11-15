//
//  FamilyViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *familyText;
- (IBAction)famHome:(id)sender;
- (IBAction)popover:(id)sender;

@end
