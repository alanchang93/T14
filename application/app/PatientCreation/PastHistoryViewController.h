//
//  PastHistoryViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastHistoryViewController : UIViewController <UITextViewDelegate, UIScrollViewDelegate>{
    NSMutableDictionary *pastHistoryDict;
}

@property (weak, nonatomic) IBOutlet UITextView *childMedical;
@property (weak, nonatomic) IBOutlet UITextView *adultMedical;
@property (weak, nonatomic) IBOutlet UITextView *childSurgical;
@property (weak, nonatomic) IBOutlet UITextView *adultSurgical;


- (IBAction)PastHistoryPopover:(id)sender;
- (IBAction)PastHistoryHome:(id)sender;


@end
