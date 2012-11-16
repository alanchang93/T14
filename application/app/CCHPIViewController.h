//
//  CCHPIViewController.h
//  app
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 Team 14. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCHPIViewController : UIViewController <UITextViewDelegate, UIScrollViewDelegate>{
    NSMutableDictionary *CCHPI;

}

@property (weak, nonatomic) IBOutlet UITextView *CCText;
@property (weak, nonatomic) IBOutlet UITextView *HPIText;

- (IBAction)popover:(id)sender;
- (IBAction)home:(id)sender;

- (NSMutableDictionary *) saveCCHPI: (NSMutableDictionary *)info;


@end
