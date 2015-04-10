//
//  ChatMessageToolView.h
//  EChat
//
//  Created by pg on 14-10-14.
//  Copyright (c) 2014年 PE. All rights reserved.
//
typedef void(^btnBlock)();
#import <UIKit/UIKit.h>

@interface ChatMessageToolView : UIView

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, assign) btnBlock btnBlock;
@end
