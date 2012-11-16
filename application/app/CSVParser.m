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
    
}


+(NSMutableDictionary *)saveData:(NSMutableDictionary *)data{
    for (id key in [data allKeys]){
        for(id k in [patient allKeys]){
            if(key == k){
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

+ (NSMutableArray *) getFileNames{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSMutableArray *nameHolder = [[NSMutableArray alloc]init];
    
    NSArray *fileList = [[NSArray alloc] init];
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error: &error];
    for (NSString *i in fileList){ //goes through each patient
        if ([i isEqualToString:@".csv"]) {
            
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
    patient = nil;
    NSLog(@"%@",fileName);
    NSMutableString *allData = [[NSMutableString alloc]initWithContentsOfFile:fileName];
    NSLog(@"%@", allData);
    return allData;
}
@end
