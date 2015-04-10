//
//  FirstViewController.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopPickerView.h"
@interface FirstViewController : UIViewController
{
    PopPickerView *picker;
    NSArray *face;
//    AVSession *_session;
    UIDynamicAnimator *animator;
    UIPushBehavior *push;
}
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)btnClicked:(id)sender;

@end
