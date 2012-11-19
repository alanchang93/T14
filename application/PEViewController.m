//
//  PEViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "PEViewController.h"
#import "CSVParser.h"

@interface PEViewController ()

@end

@implementation PEViewController

@synthesize generalField, heentField, cardioField, respField, gastroField, geniField, nervField,pulField,neuroField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Physical Exam"];
}

-(void)viewDidUnload
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    PEDict = [CSVParser getPatient];
    generalField.text = [[PEDict objectForKey:@"PEGeneral"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    heentField.text = [[PEDict objectForKey:@"PEHeent"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    cardioField.text = [[PEDict objectForKey:@"PECardio"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    respField.text = [[PEDict objectForKey:@"PEResp"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    gastroField.text = [[PEDict objectForKey:@"PEGastro"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    geniField.text = [[PEDict objectForKey:@"PEGeni"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    nervField.text = [[PEDict objectForKey:@"PENerv"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    pulField.text = [[PEDict objectForKey:@"PEMSK"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    neuroField.text = [[PEDict objectForKey:@"PENeuro"] stringByReplacingOccurrencesOfString:@";" withString:@","];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)home:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects: @"PEGeneral", @"PEHeent", @"PECardio", @"PEResp", @"PEGastro", @"PEGeni", @"PENerv", @"PEMSK", @"PENeuro", nil];
    NSString *general = [generalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *heent = [heentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *cardio = [cardioField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *resp = [respField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *gastro = [gastroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *geni = [geniField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *nerv = [nervField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *pul = [pulField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *neuro = [neuroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSMutableArray *info = [NSMutableArray arrayWithObjects:general, heent, cardio, resp, gastro, geni, nerv, pul, neuro, nil];
    if ([info count] != [headers count]) {
        for (int i = [info count] ; i < [headers count]; i++) {
            [info addObject:@" "];
        }
    }
    PEDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:PEDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}

- (IBAction)popover:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects: @"PEGeneral", @"PEHeent", @"PECardio", @"PEResp", @"PEGastro", @"PEGeni", @"PENerv", @"PEMSK", @"PENeuro", nil];
    NSString *general = [generalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *heent = [heentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *cardio = [cardioField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *resp = [respField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *gastro = [gastroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *geni = [geniField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *nerv = [nervField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *pul = [pulField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *neuro = [neuroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSMutableArray *info = [NSMutableArray arrayWithObjects:general, heent, cardio, resp, gastro, geni, nerv, pul, neuro, nil];
    if ([info count] != [headers count]) {
        for (int i = [info count] ; i < [headers count]; i++) {
            [info addObject:@" "];
        }
    }
    PEDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:PEDict];
}
@end
