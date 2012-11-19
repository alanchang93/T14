//
//  Transfer.m
//  app
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import "Transfer.h"
#import "BlueToothViewController.h"
#import "CSVParser.h"

// Global GKSession connection variable
GKSession* currentSession;
MySessionDelegate* mySessionDelegate;

@implementation Transfer

@synthesize session;
@synthesize type;
@synthesize fileName;
@synthesize data;

- (id)initWithSession:(GKSession *)nSession transferType:(TransferType)transferType
{
    self = [super init];
    self.session = nSession;
    self.type = transferType;
    return self;
}

- (void) transfer
{
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
}

// NSCoding delegates
- (id) initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.type = [aDecoder decodeIntForKey:@"type"];
        self.fileName = [aDecoder decodeObjectForKey:@"filename"];
        self.data = [aDecoder decodeObjectForKey:@"data"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*) aCoder
{
    [aCoder encodeObject:self.fileName forKey:@"filename"];
    [aCoder encodeObject:self.data forKey:@"data"];
    [aCoder encodeInt:self.type forKey:@"type"];
}

@end

//==================================
// MySessionDelegate implementation
//==================================

@implementation MySessionDelegate{
}

@synthesize listFileNames;
@synthesize listOtherFileNames;
@synthesize blueToothViewController;

- (NSArray*) getOtherFileNames
{
    return self.listOtherFileNames;
}

- (NSMutableArray*) getFileNames
{
    return self.listFileNames;
}

- (void) reloadFiles
{
    listFileNames = [CSVParser getFileNames];
}

- (id) initWithBlueToothViewController:(BlueToothViewController *)btvc
{
    blueToothViewController = btvc;
    return self;
}

- (void) updateBlueToothViewController:(BlueToothViewController *)btvc
{
    blueToothViewController = btvc;
}

- (void) receiveData:(NSData*) data fromPeer:(NSString*) peer inSession:(GKSession*) session context:(void*) context
{
    Transfer* transfer = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    switch(transfer.type)
    {
        case RECEIVE_FILE:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *dir = [paths objectAtIndex:0];
            NSString *filePath = [dir stringByAppendingPathComponent:transfer.data];
            NSString* fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
            Transfer* responseTransfer = [[Transfer alloc] initWithSession:currentSession transferType:SEND_FILE];
            responseTransfer.data = fileContent;
            responseTransfer.fileName = transfer.data;
            [responseTransfer transfer];
            break;
        }
        case RECEIVE_FILE_LISTING:
        {
            // get list of local files and send it back
            Transfer* responseTransfer = [[Transfer alloc] initWithSession:currentSession transferType:SEND_FILE_LISTING];
            [self reloadFiles];
            // retrieves list of files from bluetooth controller
            responseTransfer.data = [listFileNames componentsJoinedByString:@";"];
            [responseTransfer transfer];
            break;
        }
        case SEND_FILE:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *dir = [paths objectAtIndex:0];
            NSString *filePath = [dir stringByAppendingPathComponent:transfer.fileName];
            [transfer.data
             writeToFile:filePath atomically:YES encoding:NSASCIIStringEncoding error:nil];
            [blueToothViewController alert:[NSString stringWithFormat:@"Received file: %@", transfer.fileName]];
            if(blueToothViewController.mode == SENDING)
                [blueToothViewController setupSend];
            break;
        }
        case SEND_FILE_LISTING:
        {
            // update partner filename list
            listOtherFileNames = [transfer.data componentsSeparatedByString:@";"];
            [blueToothViewController updateTable];
            break;
        }
    }
}

@end
