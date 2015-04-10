//
//  NewsTableViewCell.h
//  EChat
//
//  Created by pg on 14-10-13.
//  Copyright (c) 2014年 PE. All rights reserved.
//
typedef void (^ImagesClickedBlock)();//(NSInteger currentIndex, NSArray *arrImages);
#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
{
//    NSArray *arrImages;
}
@property (nonatomic) NSInteger currentImgIndex;
@property (nonatomic, strong) NSArray *arrImages;

@property (strong, nonatomic)  UITextView *contentTextView;
@property (strong, nonatomic)  UIButton *btnUserImage;
@property (strong, nonatomic)  UIButton *btnUserNick;
@property (strong, nonatomic)  UILabel *lblDatetime;
@property (strong, nonatomic)  UILabel *lblFromDevice;

@property (strong, nonatomic) UIScrollView *imgsBackgroundView;

@property (strong, nonatomic) UIButton *btnWrite;
@property (strong, nonatomic) UIButton *btnComment;
@property (strong, nonatomic) UIButton *btnStar;

@property (nonatomic, strong) ImagesClickedBlock imgClickedBlock;

- (void) setContentWithMessageModel:(MessageModel *)mModel;

- (void) imageClickedBlock:(void(^)(NSInteger currentIndex, NSArray *arrImages)) imageClickedBlock;
@end
