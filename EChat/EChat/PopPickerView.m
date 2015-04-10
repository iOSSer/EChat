//
//  PopPickerView.m
//  EmoteDemo
//
//  Created by pg on 14-10-10.
//  Copyright (c) 2014年 pg. All rights reserved.
//

#import "PopPickerView.h"

@implementation PopPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization codes
        self.height = 200;
    }
    return self;
}
- (id)init
{
    self = [super init];
    self.height = 200;
    [self initToolbar];
    [self initDatePicker];
    return self;
}
- (void) initToolbar
{
    self.imgToolbar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    self.imgToolbar.userInteractionEnabled = YES;
    self.imgToolbar.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.imgToolbar];
    
    UIToolbar *tb = [[UIToolbar alloc] initWithFrame:self.imgToolbar.frame];
    [self.imgToolbar addSubview:tb];
    tb.backgroundColor = [UIColor redColor];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    tb.items = [NSArray arrayWithObjects:btn, nil];
    
}
- (void) initDatePicker
{
    self.datepicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.height - 40)];
    self.datepicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    self.datepicker.datePickerMode = UIDatePickerModeDate;
//    self.datepicker.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.datepicker];
}
- (void)show:(BOOL)animation
{
    self.hidden = NO;
    [UIView animateWithDuration:.3 animations:^{
        CGFloat y = [UIScreen mainScreen].bounds.size.height - self.height;
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    }];
}
- (void)hide:(BOOL)animation
{
    self.hidden = YES;
    [UIView animateWithDuration:.3 animations:^{
        CGFloat y = [UIScreen mainScreen].bounds.size.height + self.height;
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    }];
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
