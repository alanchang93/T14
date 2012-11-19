//
//  AssessmentViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AssessmentViewController : UIViewController{
    NSMutableDictionary *assessmentDict;
}

@property (weak, nonatomic) IBOutlet UITextView *noteField;

@property (weak, nonatomic) IBOutlet UITextField *name1;
@property (weak, nonatomic) IBOutlet UITextField *dose1;
@property (weak, nonatomic) IBOutlet UITextField *route1;
@property (weak, nonatomic) IBOutlet UITextField *freq1;

@property (weak, nonatomic) IBOutlet UITextField *name2;
@property (weak, nonatomic) IBOutlet UITextField *dose2;
@property (weak, nonatomic) IBOutlet UITextField *route2;
@property (weak, nonatomic) IBOutlet UITextField *freq2;

@property (weak, nonatomic) IBOutlet UITextField *name3;
@property (weak, nonatomic) IBOutlet UITextField *dose3;
@property (weak, nonatomic) IBOutlet UITextField *route3;
@property (weak, nonatomic) IBOutlet UITextField *freq3;

@property (weak, nonatomic) IBOutlet UITextField *name4;
@property (weak, nonatomic) IBOutlet UITextField *dose4;
@property (weak, nonatomic) IBOutlet UITextField *route4;
@property (weak, nonatomic) IBOutlet UITextField *freq4;

@property (weak, nonatomic) IBOutlet UITextField *name5;
@property (weak, nonatomic) IBOutlet UITextField *dose5;
@property (weak, nonatomic) IBOutlet UITextField *route5;
@property (weak, nonatomic) IBOutlet UITextField *freq5;

- (IBAction)home:(id)sender;
- (IBAction)popover:(id)sender;
@end
