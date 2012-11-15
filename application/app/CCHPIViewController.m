//
//  CCHPIViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "CCHPIViewController.h"

@interface CCHPIViewController ()

@end

@implementation CCHPIViewController

@synthesize CCText;
@synthesize HPIText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void) saveCCHPI:(NSMutableDictionary *)info{
    for (NSString *text in info){
        
    }
}

- (IBAction)popover:(id)sender {
    NSLog(@"%@",CCText.text);
    NSLog(@"%@", HPIText.text);
}

- (IBAction)home:(id)sender {
    NSLog(@"%@",CCText.text);
    NSLog(@"%@", HPIText.text);
}


@end
