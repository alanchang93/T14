//
//  CSVParser.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "CSVParser.h"

//NSMutableArray *_contactInfo;

static NSMutableDictionary *patient = nil;
static NSArray *fields = nil;

@implementation CSVParser


+ (void) initialize{
    fields = [NSArray arrayWithObjects: @"Visit Date",@"Name", @"DOB",@"Gender", @"City", @"State", @"Country",@"CC", @"HPI", @"Childhood Medical History", @"Adulthood Medical History", @"Childhood Surgical History", @"Adulthood Surgical History",@"Rx",@"Allergies",@"Family History",@"Drug Use",@"Drug Detail", @"Alcohol Use",@"Alcohol Detail", @"Other Information",@"ROSVital", @"ROSGeneral",@"ROSHeent", @"ROSCardio",@"ROSResp", @"ROSGastro", @"ROSGeni" ,@"ROSNervous" ,@"ROSPulmonary",@"ROSNeuro",@"PEGeneral", @"PEHeent", @"PECardio", @"PEResp", @"PEGastro", @"PEGeni", @"PENerv", @"PEPul", @"PENeuro", @"Lab&Other",@"prescript", @"notes",@"Physician", @"Med Student", nil];
    NSArray *blanks = [NSArray arrayWithObjects: @"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"" ,@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];

    patient = [[NSMutableDictionary alloc] initWithObjects: blanks forKeys:fields];
}


+(NSMutableDictionary *)saveData:(NSMutableDictionary *)data{
    for (NSString *key in [data allKeys]){
        for(NSString *k in [patient allKeys]){
            if([key isEqualToString: k]){
                [patient setObject: [data objectForKey:key] forKey: k];
            }
            
        }
    }
    return patient;
}



+(void) writeData{
    NSMutableString *headers = [[NSMutableString alloc] init];
    NSMutableString *data = [[NSMutableString alloc] init];

    //NSArray * objects = [patient objectsForKeys: sortedKeys notFoundMarker: [NSNull null]];
    
    for (NSString *key  in[[patient allKeys]sortedArrayUsingSelector:@selector(compare:) ]) {
        [headers appendString: key];
        [headers appendString: @","];
        [data appendString: [patient objectForKey:key]];
        [data appendString: @","];
    }
    /*
    for (NSString *key in patient){
        [headers appendString: key];
        [headers appendString: @","];
        [data appendString: [patient objectForKey:key]];
        [data appendString: @","];
    }
     */
    NSString *fileName = [NSString stringWithFormat:@"%@%@%@%@",[patient objectForKey:@"Name"],@" ",[patient objectForKey:@"DOB"],@".csv"];
    NSMutableArray *fileList = [CSVParser getFileNames];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:fileName];
    NSString *toFile;
    if (![fileList containsObject: fileName]){
    headers = [NSMutableString stringWithFormat:@"%@\n", headers];
    [headers appendString: data];
    toFile = headers;
    }
    else{
        NSMutableString *allData = [[NSMutableString alloc]initWithContentsOfFile:filePath];
        NSString *tmp = [NSString stringWithFormat:@"\n%@", data];
        [allData appendString: tmp];
        toFile = allData;
    }

    [toFile writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

+ (NSMutableArray *) getFileNames{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSMutableArray *nameHolder = [[NSMutableArray alloc]init];
    
    NSArray *fileList = [[NSArray alloc] init];
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error: &error];
    for (NSString *i in fileList){ //goes through each patient
        if ([i isEqualToString:@" .csv"]) {
           }
        else if([i isEqualToString:@".DS_Store"]) {
            
        }
        else {
        [nameHolder addObject:i];
        }
    }
    return nameHolder;
}

//Method does not seem to be working :(
+(NSMutableDictionary *) loadDataFromFile: (NSString *) fileName {
    //patient = [[NSMutableDictionary alloc] init];
    NSMutableString *allData = [[NSMutableString alloc]initWithContentsOfFile:fileName];
    NSArray *visit = [allData componentsSeparatedByString:@"\n"];
    NSString *latestVisit = [visit objectAtIndex:[visit count]-1];
    NSArray *patientInfo = [latestVisit componentsSeparatedByString:@","];
    NSMutableArray *fileList = [CSVParser getFileNames];
    NSString *Name = [NSString stringWithFormat:@"%@%@%@%@",[patient objectForKey:@"Name"],@" ",[patient objectForKey:@"DOB"],@".csv"];
    if ([patientInfo count] > 46){ //change if new fields are added or removed
        for (int i = 0; i < [fields count]; i++){
            [patient setObject:[patientInfo objectAtIndex: i+[fields count]] forKey:[fields objectAtIndex:i]];
        }
    }
    else{
        for (int i = 0; i < [fields count]; i++){
            [patient setObject:[patientInfo objectAtIndex: i] forKey:[[fields sortedArrayUsingSelector:@selector(compare:) ] objectAtIndex:i]];
        }
    }
    return patient;
}

+ (NSMutableDictionary *) getPatient{
    return patient;
    
}

+(NSMutableDictionary *)clearPatient{
    patient = [[NSMutableDictionary alloc] init];
    return patient;
}
@end
