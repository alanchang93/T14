//
//  ViewController.h
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIDropDownMenu.h"


@interface ViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray * _contactInfo;
    NSArray *countryList;
    UIPickerView *countryField;
    //IBOutlet UITextField *textfield;
    //UIDropDownMenu *menu;
}

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *dob;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *zip;
@property (copy, nonatomic) NSString *cell;
@property (copy, nonatomic) NSString *work;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *country;
//@property (strong, nonatomic) IBOutlet UITextField *textfield;
//@property (strong, nonatomic) UIDropDownMenu *menu;
@property (strong, nonatomic) IBOutlet UIPickerView *countryField;

@end
