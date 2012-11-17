//
//  PEViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PEViewController : UIViewController {
    NSMutableDictionary *PEDict;
}
@property (weak, nonatomic) IBOutlet UITextField *generalField;
@property (weak, nonatomic) IBOutlet UITextField *heentField;
@property (weak, nonatomic) IBOutlet UITextField *cardioField;
@property (weak, nonatomic) IBOutlet UITextField *respField;
@property (weak, nonatomic) IBOutlet UITextField *gastroField;
@property (weak, nonatomic) IBOutlet UITextField *geniField;
@property (weak, nonatomic) IBOutlet UITextField *nervField;
@property (weak, nonatomic) IBOutlet UITextField *pulField;
@property (weak, nonatomic) IBOutlet UITextField *neuroField;

- (IBAction)home:(id)sender;
- (IBAction)popover:(id)sender;

@end
