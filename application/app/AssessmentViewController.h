//
//  AssessmentViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssessmentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *RxField;
@property (weak, nonatomic) IBOutlet UITextView *noteField;

- (IBAction)home:(id)sender;
- (IBAction)popover:(id)sender;
@end