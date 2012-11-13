//
//  ViewController.h
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    NSMutableArray * _contactInfo;
}

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *dob;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *zip;
@property (copy, nonatomic) NSString *cell;
@property (copy, nonatomic) NSString *work;
@property (copy, nonatomic) NSString *email

@end
