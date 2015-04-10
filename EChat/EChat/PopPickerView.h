//
//  PopPickerView.h
//  EmoteDemo
//
//  Created by pg on 14-10-10.
//  Copyright (c) 2014年 pg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopPickerView : UIView
{
//    CGFloat height;
}
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, strong) UIToolbar *toolbar;

@property (nonatomic, strong) UIImageView *imgToolbar;

@property (nonatomic, strong) UIDatePicker *datepicker;
-(void) show:(BOOL) animation;

-(void) hide:(BOOL) animation;

@end
