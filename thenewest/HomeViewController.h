//
//  HomeViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *connection;

- (IBAction)newPatientButton:(id)sender;
- (IBAction)PatientSearch:(id)sender;

@end
