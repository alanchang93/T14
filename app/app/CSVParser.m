//
//  CSVParser.m
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "CSVParser.h"

//NSMutableArray *_contactInfo;

@implementation CSVParser

+(void) loadData: (NSMutableArray *)data{
    for (NSString *s in data){
       NSLog(@"%@",s);
       // NSLog(@"this");
    }
   // NSLog(@"works");
    
}

+(void) writeData: (NSMutableArray *)write {
    
    NSString *data = [write componentsJoinedByString:@","];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@%@%@%@",[write objectAtIndex:0],@" ",[write objectAtIndex:1],@".csv"];
    NSString *filePath = [dir stringByAppendingPathComponent:fileName];
    [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

//-(void) readData:(NSMutableArray *)read {
    //reads csv files
    
    /*
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
     */
//}

@end
