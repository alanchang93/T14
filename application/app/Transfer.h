//
//  Transfer.h
//  app
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@class BlueToothViewController;

typedef enum
{
    SEND_FILE,
    SEND_FILE_LISTING,
    RECEIVE_FILE,
    RECEIVE_FILE_LISTING
} TransferType;

extern GKSession* currentSession;

@interface Transfer : NSObject <NSCoding>
- (id)initWithSession:(GKSession*) session transferType:(TransferType) transferType;
- (void) transfer;

@property (nonatomic) GKSession* session;
@property (nonatomic) TransferType type;
@property (nonatomic) NSString* fileName;
@property (nonatomic) NSString* data;

@end

// Session Controller DELEGATE
@interface MySessionDelegate : NSObject<GKSessionDelegate>
- (void) receiveData:(NSData*) data fromPeer:(NSString*) peer inSession:(GKSession*) session context:(void*) context;
- (void) reloadFiles;
@property (nonatomic) BlueToothViewController* blueToothViewController;
@property (nonatomic) NSMutableArray* listFileNames;
@property (nonatomic) NSArray* listOtherFileNames;


- (id)initWithBlueToothViewController:(BlueToothViewController*) btvc;
- (void)updateBlueToothViewController:(BlueToothViewController*) btvc;
- (NSArray*) getOtherFileNames;
- (NSMutableArray*) getFileNames;
- (void) testFunction;

@end;

extern MySessionDelegate* mySessionDelegate;
