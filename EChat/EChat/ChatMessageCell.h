//
//  ChatMessageCell.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatMessageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *btnUser;
@property (strong, nonatomic)  UILabel *lblDate;
@property (strong, nonatomic) UIImageView *imgBubble;
@property (strong, nonatomic) UITextView *messageTextView;
@property (strong, nonatomic) UIImageView *imageview;

@property (strong, nonatomic) UIWebView *webViewImage;
@property (strong, nonatomic) UIActivityIndicatorView *activityStatus;


@property (nonatomic, strong) MessageModel *msgModel;
@end
