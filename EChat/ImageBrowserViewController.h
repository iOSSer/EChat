//
//  ImageBrowserViewController.h
//  EChat
//
//  Created by pg on 14-10-15.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageBrowserViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@property (nonatomic, strong) NSArray *arrImages;
@property (nonatomic) NSInteger currentIndex;
@end
