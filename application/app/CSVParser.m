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

@implementation CSVParser


+ (void) initialize{
    NSArray *fields = [NSArray arrayWithObjects: @"Name", @"DOB",@"Address", @"City", @"State", @"Country", @"Zip Code", @"Cell Phone", @"Work Phone", @"Email", nil];
    NSArray *blanks = [NSArray arrayWithObjects: @"",@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];
    patient = [[NSMutableDictionary alloc] initWithObjects: blanks forKeys:fields];
    NSLog(@"%@",patient);
    
}


+(NSMutableDictionary *)saveData:(NSMutableDictionary *)data{
    NSLog(@"%@",patient);
    NSLog(@"%@", [patient allKeys]);
    for (id key in [data allKeys]){
        for(id k in [patient allKeys]){
            NSLog(@"%@",k);
            NSLog(@"%@",key);
            if(key == k){
                NSLog(@"hi");
                [patient setObject: [data objectForKey:key] forKey: k];
            }
        }
    }
    return patient;
}



+(void) writeData: (NSMutableDictionary *)write {
    NSLog(@"%@",write);
    NSMutableString *headers = [[NSMutableString alloc] init];
    NSMutableString *data = [[NSMutableString alloc] init];
    for (NSString *key in write){
        [headers appendString: key];
        [headers appendString: @","];
        [data appendString: [write objectForKey:key]];
        [data appendString: @","];
    }
    headers = [NSMutableString stringWithFormat:@"%@\n", headers];
    [headers appendString: data];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@%@%@%@",[write objectForKey:@"Name"],@" ",[write objectForKey:@"DOB"],@".csv"];
    NSString *filePath = [dir stringByAppendingPathComponent:fileName];
    [headers writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}
/*
+(void) readData:(NSMutableArray *)read {
    //reads csv files
    

    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    
    NSArray *fileList = [[NSArray alloc] init];
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error: &error];
    for (NSString *i in fileList){ //goes through each patient
        //NSLog(@"%@", i);
        NSString *fileName = [NSString stringWithFormat:@"%@",i];
        NSString *filePath = [dir stringByAppendingPathComponent:fileName];
        NSString *items = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        NSArray *rows = [items componentsSeparatedByString:@"\n"];
        //NSLog(@"%@",items);
        
        NSArray *patient;
        for(int i = 0; i<[rows count]; i++){ //gets each tab on patient
            patient = [[rows objectAtIndex:i] componentsSeparatedByString:@","];
            for (int i = 0; i < [patient count]; i++){ //gets each item per tab
                //NSLog(@"%@", [patient objectAtIndex:i]);
            }
        }
    }
     
}
*/
@end
