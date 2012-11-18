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

@property (weak, nonatomic) IBOutlet UITextField *visitDateField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
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
    countryList =[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]];
    //countryList = [[NSArray alloc] initWithObjects:@"USA", @"Mexico",@"Canada",nil];
    background.hidden = YES;
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Basic Contact Information"];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    background.frame = CGRectMake(0, 1000, 768, 263);
}

-(void)viewDidAppear:(BOOL)animated{
    contact = [CSVParser getPatient];
    self.visitDateField.text = [[contact objectForKey:@"Visit Date"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.nameField.text = [[contact objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@";" withString: @","];
    self.dobField.text = [[contact objectForKey:@"DOB"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.genderField.text = [[contact objectForKey:@"Gender"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.cityField.text = [[contact objectForKey: @"City"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.stateField.text = [[contact objectForKey:@"State"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    self.countryField.text = [[contact objectForKey:@"Country"] stringByReplacingOccurrencesOfString:@";" withString:@","];
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
    [self.visitDateField resignFirstResponder];
    [self.nameField resignFirstResponder];
    [self.dobField resignFirstResponder];
    [self.genderField resignFirstResponder];
    [self.cityField resignFirstResponder];
    [self.stateField resignFirstResponder];
    [countryField resignFirstResponder];
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

-(IBAction)home:(id)sender{
    self.visitDate = [self.visitDateField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.name = [self.nameField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.dob = [self.dobField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.gender = [self.genderField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.city = [self.cityField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.state = [self.stateField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.country = [self.countryField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    
    //add stuff into the array
       _contactInfo = [NSMutableArray arrayWithObjects: self.visitDate, self.name, self.dob, self.gender, self.city, self.state,self.country, nil];
    NSMutableArray *fields = [NSMutableArray arrayWithObjects: @"Visit Date", @"Name", @"DOB",@"Gender", @"City", @"State", @"Country", nil];
    if ([_contactInfo count] == 0) {
        for (NSString *blank in fields) {
            [_contactInfo addObject:@" "];
        }
    }
    NSDictionary *contact = [[NSDictionary alloc] initWithObjects: _contactInfo forKeys:fields];
    [CSVParser saveData:contact];
    [CSVParser writeData];
    [CSVParser clearPatient];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)popover:(id)sender {
    self.visitDate = [self.visitDateField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.name = [self.nameField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.dob = [self.dobField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.gender = [self.genderField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.city = [self.cityField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.state = [self.stateField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    self.country = [self.countryField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    
    //add stuff into the array
       _contactInfo = [NSMutableArray arrayWithObjects: self.visitDate, self.name, self.dob, self.gender, self.city, self.state,self.country, nil];
    NSMutableArray *fields = [NSMutableArray arrayWithObjects: @"Visit Date", @"Name", @"DOB",@"Gender", @"City", @"State", @"Country", nil];
    NSDictionary *contact = [[NSDictionary alloc] initWithObjects: _contactInfo forKeys:fields];
    [CSVParser saveData:contact];
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
    self.visitDateField.text = nil;
    self.nameField.text = nil;
    self.dobField.text = nil;
    self.genderField.text = nil;
    self.cityField.text = nil;
    self.stateField.text = nil;
    self.countryField.text = nil;

}

//***************************For Country Field Picker***********************


/*
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
 */

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.countryField.text = [[self.countryList objectAtIndex:row] objectForKey:@"name"];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countryList.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self.countryList objectAtIndex:row] objectForKey:@"name"];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
@end
