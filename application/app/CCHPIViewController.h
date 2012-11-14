//
//  CCHPIViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCHPIViewController : UIViewController <UITextViewDelegate>{
    NSMutableDictionary *CCHPI;
}

@property (weak, nonatomic) IBOutlet UITextView *CCText;
@property (weak, nonatomic) IBOutlet UITextView *HPIText;

- (IBAction)popover:(id)sender;
- (IBAction)home:(id)sender;

+(void) saveCCHPI: (NSMutableDictionary *)info;

@end
