//
//  ViewController.m
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//
#import "ViewController.h"


@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property (weak, nonatomic) IBOutlet UITextField *workField;
@property (weak, nonatomic) IBOutlet UILabel *workLabel;

@property (weak, nonatomic) IBOutlet UITextField *cellField;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;


@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UILabel *zipLabel;

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
- (IBAction)update:(id)sender; //update function pertains to the save button

@end



@implementation ViewController 

//@synthesize country,  menu;

- (void)viewDidLoad
{
    [super viewDidLoad];
   /* menu = [[UIDropDownMenu alloc] init];
    NSArray *arrayNames = [[NSArray alloc] initWithObjects:
                           @"Erik Vanderwal",
                           @"Max Town",
                           @"Darryl Totman",
                           @"Avis Villalon",
                           @"Hugh Salvia",
                           @"Allie Maland",
                           nil];
    [menu makeMenu:self.countryField titleArray:arrayNames valueArray: arrayNames targetView:self.view];
    [menu setDropdownTextColor:[UIColor whiteColor]];
    [menu setDropdownBackgroundColor:[UIColor darkGrayColor]];
    */
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)update:(id)sender {
	//assigns a string variable to the text in the textboxes
    self.name = self.nameField.text;
    self.dob = self.dobField.text;
    self.address = self.addressField.text;
    self.city = self.cityField.text;
    self.state = self.stateField.text;
    self.zip = self.zipField.text;
    self.cell = self.cellField.text;
    self.work = self.workField.text;
    self.email = self.emailField.text;
    
    _contactInfo = [[NSMutableArray alloc] initWithObjects:@[self.name, self.dob, self.address,self.city, self.state, self.zip, self.cell, self.work, self.email],nil];
    
    

    NSLog(@"%@",_contactInfo); //prints what is in contact info list
}

- (BOOL) nameFieldShouldReturn: (UITextField *) textField {
    if (textField == self.nameField){
        [textField resignFirstResponder];
    }
    return YES;
}
@end
