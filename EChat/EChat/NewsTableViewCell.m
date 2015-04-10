//
//  NewsTableViewCell.m
//  EChat
//
//  Created by pg on 14-10-13.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIButton+WebCache.h"
@implementation NewsTableViewCell

- (id)init
{
    self = [super init];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (void) initSubviews
{
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!self.btnUserImage) {
        self.btnUserImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnUserImage setBackgroundImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];
        self.btnUserImage.frame = CGRectMake(7, 10, 50, 40);
        [self.contentView addSubview:self.btnUserImage];
    }
    
    if (!self.btnUserNick) {
        self.btnUserNick = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnUserNick.backgroundColor = [UIColor clearColor];
        self.btnUserNick.frame = CGRectMake(5 + 50 + 5, 10, (self.width - 50 - 15), 40);
        [self.btnUserNick setTitle:@"user" forState:UIControlStateNormal];
        [self.btnUserNick setTitleColor:self.btnUserNick.tintColor forState:UIControlStateNormal];
        [self.btnUserNick setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        self.btnUserNick.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.contentView addSubview:self.btnUserNick];
    }
    if (!self.contentTextView) {
        self.contentTextView = [[UITextView alloc] init];
        self.contentTextView.frame = CGRectMake(5, 10 + 40 + 5, self.width - 10, 40);
        self.contentTextView.userInteractionEnabled = NO;
        self.contentTextView.font = [UIFont systemFontOfSize:15.f];
        [self.contentView addSubview:self.contentTextView];
    }
    if (!self.lblDatetime) {
        self.lblDatetime = [[UILabel alloc] initWithFrame:CGRectMake((self.width - self.width/2 - 5), 5, self.width/2, 30)];
        self.lblDatetime.backgroundColor  = [UIColor clearColor];
        self.lblDatetime.textAlignment = NSTextAlignmentRight;
        self.lblDatetime.font = [UIFont systemFontOfSize:13.f];
        [self.contentView addSubview:self.lblDatetime];
        [self.contentView sendSubviewToBack:self.lblDatetime];
    }
    if (!self.imgsBackgroundView) {
        self.imgsBackgroundView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.imgsBackgroundView.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.imgsBackgroundView];
//        [self.contentView sendSubviewToBack:self.imgsBackgroundView];
    }
    
    if (!self.btnWrite) {
        self.btnWrite = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnWrite.frame = CGRectZero;
        self.btnWrite.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.btnWrite];
    }
    
}

- (void)awakeFromNib
{
    
}
- (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
void(^_Successblock)();
void(^_findPasswordblock)();


- (void)addLoginInSuccessBlock:(void(^)())Successblock withFindPasswordBlock:(void(^)())findPasswordblock
{
    _Successblock = Successblock;
    _findPasswordblock = findPasswordblock;
}
- (void)setContentWithMessageModel:(MessageModel *)mModel
{
//    CGFloat writeHeight = 40;
        CGSize size = [GlobalObject sizeWithText:mModel.messageContent font:[UIFont systemFontOfSize:15.f]];
    
    
    
//    if (mModel.messagePhotos != nil) {
//        
////        self.contentTextView.backgroundColor = [UIColor lightGrayColor];
////        NSLog(@"%f %f", self.contentTextView.top, self.contentTextView.height);
////        NSLog(@"%f", self.contentTextView.top + self.contentTextView.height);
//        self.imgsBackgroundView.frame = CGRectMake(5, self.contentTextView.top + self.contentTextView.height + 130, self.contentView.width - 10, 190);
//        self.imgsBackgroundView.backgroundColor = [UIColor clearColor];
//        for (int i=0; i<mModel.messagePhotos.count; i++) {
//            UIImage *image = [UIImage imageNamed:mModel.messagePhotos[i]];
////            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectZero];
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////            [GlobalObject setRadiusWithView:button value:10.];
//            [button setImageWithURL:nil forState:UIControlStateNormal placeholderImage:image];
//            button.imageView.contentMode = UIViewContentModeScaleAspectFill;
////            button.contentMode = UIViewContentModeCenter;
////            imageview.contentMode = UIViewContentModeScaleAspectFit;
////            imageview.image = image;
//            CGFloat size = 60;
//            CGFloat xOrigin = 20;
////                UIView *view = [[UIView alloc] init];
//                button.size = CGSizeMake(size, size);
//                button.left = (size + xOrigin) * (i % 4);
//                button.top = (size + xOrigin) * (i / 4);
//                button.backgroundColor = [UIColor clearColor];
//            button.tag = i;
//            [button addTarget:self action:@selector(btnImagesClicked:) forControlEvents:UIControlEventTouchUpInside];
//                [self.imgsBackgroundView addSubview:button];
//        }
//        self.arrImages = mModel.messagePhotos;
//        //        UIView *imgBgView = [[UIView alloc] init];
//        //        imgBgView.frame = CGRectMake(5, cell.contentTextView.top + cell.contentTextView.height, cell.contentView.width - 10, 150);
//        //        imgBgView.backgroundColor = [UIColor lightGrayColor];
//        //        [cell.contentView addSubview:imgBgView];
//        //    }
//        self.btnWrite.frame = CGRectMake(0, self.imgsBackgroundView.top + self.imgsBackgroundView.height - writeHeight, self.contentView.width, writeHeight);
//    }else
//    {
//        self.contentTextView.height = size.height;
//        self.btnWrite.frame = CGRectMake(0, self.contentTextView.top + self.contentTextView.height, self.contentView.width, writeHeight);
//        
//    }
    self.contentTextView.height = size.height - 40;
    if (mModel.messagePhotos) {
        
        CGFloat width = 70;
        CGFloat height = 80;
//        NSInteger line = 3;
        self.imgsBackgroundView.layer.borderColor = [UIColor blackColor].CGColor;
        self.imgsBackgroundView.layer.borderWidth = 2;
        self.imgsBackgroundView.frame = CGRectMake(0, self.contentTextView.height+ 50, self.width, 90 * mModel.messagePhotos.count/3);
        
        for (int i = 0; i<mModel.messagePhotos.count; i++) {
            UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
            btnImage.frame = CGRectMake((mModel.messagePhotos.count % 3 + 5) * width, (mModel.messagePhotos.count / 3 + 5) * i * height, width, height);
            btnImage.frame = CGRectMake(i * width + i * 10, 0, width, height);
            btnImage.backgroundColor = [UIColor orangeColor];
            [self.imgsBackgroundView addSubview:btnImage];
        }
        
    }
    
//    self.btnWrite.frame = CGRectMake(0, self.contentTextView.top + self.contentTextView.height + self.imgsBackgroundView.height + self.imgsBackgroundView.top, self.contentView.width/3, writeHeight);
//    NSLog(@"%f", self.contentView.height);
////    self.contentView.backgroundColor = [UIColor orangeColor];
////    [GlobalObject setRadiusWithView:self.contentView value:10];
//    NSLog(@"%@", NSStringFromCGRect(self.btnWrite.frame));
//    [self.btnWrite setTitle:@"string" forState:UIControlStateNormal];
}
- (IBAction)btnImagesClicked:(UIButton *)sender
{
    self.currentImgIndex = sender.tag;
//    NSDictionary *dic = @{@"currentindex": [NSNumber numberWithInt:sender.tag], @"imagesarray":self.arrImages};
    if (self.imgClickedBlock) {
        self.imgClickedBlock();
    }
}

- (void) imageClickedBlock:(void(^)(NSInteger currentIndex, NSArray *arrImages)) imageClickedBlock
{
    imageClickedBlock(self.currentImgIndex, self.arrImages);
}
//-(void)btnImageClickedBlock:(void(^)(NSInteger currentIndex, NSArray *arrImages)) ClickedBlock
//{
//    NSArray *arrImages;
//    ClickedBlock(1, arrImages);
//}
@end
