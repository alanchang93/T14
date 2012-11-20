//
//  ViewController.h
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ContactViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray * _contactInfo;
    NSMutableDictionary *contact;
    NSString *data;
}

@property (copy, nonatomic) NSString *visitDate;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *dob;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *gender;
@property (copy, nonatomic) NSString *country;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) NSArray *countryList;

@property (strong, nonatomic) IBOutlet UIView *background;
- (IBAction)showDropDown:(id)sender;
- (IBAction)hidButton:(id)sender;
- (IBAction)home:(id)sender;
- (IBAction)popover:(id)sender;

- (IBAction)clearButton:(id)sender;

@end
