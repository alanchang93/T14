//
//  ROSViewController.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "ROSViewController.h"
#import "CSVParser.h"

@interface ROSViewController ()

@end

@implementation ROSViewController

@synthesize vitalField, generalField, heentField, cardioField, respField, gastroField, geniField, nervField, pulField, neuroField;

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
}

-(void) viewDidAppear:(BOOL)animated{
    ROSDict = [CSVParser getPatient];
    vitalField.text = [[ROSDict objectForKey:@"ROSVital"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    generalField.text = [[ROSDict objectForKey:@"ROSGeneral"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    heentField.text = [[ROSDict objectForKey:@"ROSHeent"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    cardioField.text = [[ROSDict objectForKey:@"ROSCardio"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    respField.text = [[ROSDict objectForKey:@"ROSResp"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    gastroField.text = [[ROSDict objectForKey:@"ROSGastro"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    geniField.text = [[ROSDict objectForKey:@"ROSGeni"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    nervField.text = [[ROSDict objectForKey:@"ROSNervous"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    pulField.text = [[ROSDict objectForKey:@"ROSPulmonary"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    neuroField.text = [[ROSDict objectForKey:@"ROSNeuro"] stringByReplacingOccurrencesOfString:@";" withString:@","];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popover:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects:@"ROSVital", @"ROSGeneral",@"ROSHeent", @"ROSCardio",@"ROSResp", @"ROSGastro", @"ROSGeni" ,@"ROSNervous" ,@"ROSPulmonary",@"ROSNeuro", nil];
    NSString *vital = [vitalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *general = [generalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *heent = [heentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *cardio = [cardioField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *resp = [respField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *gastro =[gastroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *geni = [geniField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *nerv = [nervField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *pul = [pulField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *neuro = [neuroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSArray *info = [[NSArray alloc] initWithObjects: vital, general, heent, cardio, resp, gastro, geni, nerv, pul, neuro, nil];
    ROSDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:ROSDict];
}

- (IBAction)home:(id)sender {
    NSArray *headers = [[NSArray alloc] initWithObjects:@"ROSVital", @"ROSGeneral",@"ROSHeent", @"ROSCardio",@"ROSResp", @"ROSGastro", @"ROSGeni" ,@"ROSNervous" ,@"ROSPulmonary",@"ROSNeuro", nil];
    NSString *vital = [vitalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *general = [generalField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *heent = [heentField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *cardio = [cardioField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *resp = [respField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *gastro =[gastroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *geni = [geniField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *nerv = [nervField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *pul = [pulField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSString *neuro = [neuroField.text stringByReplacingOccurrencesOfString:@"," withString:@";"];
    NSArray *info = [[NSArray alloc] initWithObjects: vital, general, heent, cardio, resp, gastro, geni, nerv, pul, neuro, nil];
    ROSDict = [[NSMutableDictionary alloc] initWithObjects:info forKeys:headers];
    [CSVParser saveData:ROSDict];
    [CSVParser writeData];
    [CSVParser clearPatient];
}
@end
