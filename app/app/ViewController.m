//
//  ViewController.m
//  app
//
//  Created by App Jam on 11/10/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *updatedName;
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
    
    /*
    NSString *nameString = self.name;
    if([nameString length] == 0) {
        nameString = @"World";
    }
    */
    
    self.updatedName.text = self.name;
}

- (BOOL) nameFieldShouldReturn: (UITextField *) textField {
    if (textField == self.nameField){
        [textField resignFirstResponder];
    }
    return YES;
}
@end
