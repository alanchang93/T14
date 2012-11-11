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

@end
