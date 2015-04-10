//
//  ChatMessageToolView.m
//  EChat
//
//  Created by pg on 14-10-14.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "ChatMessageToolView.h"

@implementation ChatMessageToolView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)layoutSubviews
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"message" forState:UIControlStateNormal];
    button.frame = self.bounds;
    [self addSubview:button];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(60, 1, (MAIN_SCREEN.width - 60 * 2), 38)];
    self.textView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.textView];
}
- (IBAction)btnClicked:(id)sender
{
    if (self.btnBlock) {
        [self btnBlock];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
