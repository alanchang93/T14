//
//  ViewController.m
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@property (weak, nonatomic) IBOutlet UITextField *dobField;
@property (weak, nonatomic) IBOutlet UILabel *dobLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)update:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)update:(id)sender {
    self.name = self.nameField.text;
    self.dob = self.dobField.text;
    self.address = self.addressField.text;
    self.city = self.cityField.text;
    self.state = self.stateField.text;
    
    _contactInfo = [[NSMutableArray alloc] initWithObjects:@[self.name, self.dob, self.address,self.city, self.state],nil];
    
    

    NSLog(@"%@",_contactInfo);
}

- (BOOL) nameFieldShouldReturn: (UITextField *) textField {
    if (textField == self.nameField){
        [textField resignFirstResponder];
    }
    return YES;
}
@end
