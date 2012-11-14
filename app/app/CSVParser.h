//
//  CSVParser.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSVParser : NSObject

extern NSMutableArray *_contactInfo;

+ (void) loadData:(NSMutableArray *) data;

+ (void) writeData:(NSMutableArray *) write;

//+ (void) readData:(NSMutableArray *) read;

@end
