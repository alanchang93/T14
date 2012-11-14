//
//  CSVParser.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSVParser : NSObject{
    NSMutableDictionary *patient;
    NSArray *fields;
}

extern NSMutableDictionary *contact;

+ (void) writeData:(NSMutableDictionary *) write;

+ (NSMutableDictionary *)saveData: (NSMutableDictionary *) data;
//+ (void) readData:(NSMutableArray *) read;

@end
