//
//  PastHistoryViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastHistoryViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *childMedical;
@property (weak, nonatomic) IBOutlet UITextView *adultMedical;

@property (weak, nonatomic) IBOutlet UITextView *childSugical;
@property (weak, nonatomic) IBOutlet UITextView *adultSurgical;

- (IBAction)popover:(id)sender;
- (IBAction)home:(id)sender;

@end
