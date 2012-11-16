//
//  ViewController.m
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//
#import "ContactViewController.h"
#import "CSVParser.h"


@interface ContactViewController ()

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



@implementation ContactViewController 

@synthesize picker;
@synthesize countryField;
@synthesize countryList;
@synthesize background;


- (void)viewDidLoad
{
    picker.showsSelectionIndicator = TRUE;
    countryList = [[NSArray alloc] initWithObjects:@"USA", @"Mexico",@"Canada",nil];
    background.hidden = YES;
    
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    background.frame = CGRectMake(0, 1000, 768, 263);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.nameField resignFirstResponder];
    [self.dobField resignFirstResponder];
    [self.addressField resignFirstResponder];
    [self.cityField resignFirstResponder];
    [self.stateField resignFirstResponder];
    [countryField resignFirstResponder];
    [self.zipField resignFirstResponder];
    [self.cellField resignFirstResponder];
    [self.workField resignFirstResponder];
    [self.emailField resignFirstResponder];
    return YES;
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == countryField){
        background.hidden = NO;
        [countryField resignFirstResponder];
        return NO;
    }
    else{
        background.hidden = YES;
        return YES;
    }
}

- (IBAction)showDropDown:(id)sender {
    //shows pickerview
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    background.frame = CGRectMake(0, 741, 768, 263);
    [UIView commitAnimations];
    
}

- (IBAction)hidButton:(id)sender {
    //hides pickerview
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    background.frame = CGRectMake(0, 1000, 768, 263);
    [UIView commitAnimations];
}

- (IBAction)clearButton:(id)sender {
    //clears all textfields
    self.nameField.text = nil;
    self.dobField.text = nil;
    self.addressField.text = nil;
    self.cityField.text = nil;
    self.stateField.text = nil;
    self.countryField.text = nil;
    self.zipField.text = nil;
    self.cellField.text = nil;
    self.workField.text = nil;
    self.emailField.text = nil;
    
}



//********************************* Save Button ****************************

- (IBAction)update:(id)sender {
	//assigns a string variable to the text in the textboxes
    self.name = self.nameField.text;
    self.dob = self.dobField.text;
    self.address = self.addressField.text;
    self.city = self.cityField.text;
    self.state = self.stateField.text;
    self.country = self.countryField.text;
    self.zip = self.zipField.text;
    self.cell = self.cellField.text;
    self.work = self.workField.text;
    self.email = self.emailField.text;
    
    //add stuff into the array
    _contactInfo = [NSMutableArray arrayWithObjects:self.name, self.dob, self.address,self.city, self.state, self.country, self.zip, self.cell, self.work, self.email,nil];
    NSMutableArray *fields = [NSMutableArray arrayWithObjects: @"Name", @"DOB",@"Address", @"City", @"State", @"Country", @"Zip Code", @"Cell Phone", @"Work Phone", @"Email", nil];
    
    NSDictionary *contact = [[NSDictionary alloc] initWithObjects: _contactInfo forKeys:fields];
    [CSVParser writeData:contact];
    //NSLog(@"%@",[[CSVParser saveData: contact] objectForKey:@"Name"]);
    //[CSVParser readData: _contactInfo];
}

//***************************For Country Field Picker***********************

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [countryList count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [countryList objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
        self.countryField.text=[countryList objectAtIndex:row];
    return;
}




@end
