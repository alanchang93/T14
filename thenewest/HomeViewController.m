//
//  HomeViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "HomeViewController.h"
#import "Transfer.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *disconnectButton;

@end

@implementation HomeViewController
@synthesize disconnectButton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    if(currentSession)
        [disconnectButton setHidden:NO];
    else
        [disconnectButton setHidden:YES];
}
- (IBAction)disconnect:(id)sender {
    if(currentSession)
    {
        [currentSession disconnectFromAllPeers];
        currentSession = nil;
        [disconnectButton setHidden:YES];
    }
}

- (void)viewDidLoad
{
    self.navigationItem.hidesBackButton = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newPatientButton:(id)sender {
}

- (IBAction)PatientSearch:(id)sender {
}
@end
