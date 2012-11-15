//
//  RxAllergiesViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RxAllergiesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *RxName;
@property (weak, nonatomic) IBOutlet UITextField *RxDose;
@property (weak, nonatomic) IBOutlet UITextField *RxRoute;
@property (weak, nonatomic) IBOutlet UITextField *RxFrequency;
@property (weak, nonatomic) IBOutlet UITextField *RxStarted;
@property (weak, nonatomic) IBOutlet UITextField *RxEnded;

- (IBAction)addRx:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *allergiesItem;
@property (weak, nonatomic) IBOutlet UITextField *allergiesReaction;

- (IBAction)addAllergies:(id)sender;





@end
