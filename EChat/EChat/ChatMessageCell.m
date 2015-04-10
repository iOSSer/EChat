//
//  ChatMessageCell.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//
#define meid @"lipeng"
#import "ChatMessageCell.h"

@implementation ChatMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (void) initSubviews
{
    self.backgroundColor = [UIColor clearColor];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!self.lblDate) {
        self.lblDate = [[UILabel alloc] init];
        self.lblDate.frame = CGRectMake((self.contentView.width - 100)/2, 0, 100, 15);
        self.lblDate.backgroundColor = [UIColor blueColor];
        [GlobalObject setRadiusWithView:self.lblDate value:5];
        self.lblDate.alpha = .5;
        self.lblDate.hidden = YES;
        [self.contentView addSubview:self.lblDate];
    }
    if (!self.btnUser) {
        self.btnUser = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnUser.frame = CGRectMake(10, 11, 45, 45);
        
        self.btnUser.backgroundColor = [UIColor clearColor];
        [GlobalObject setRadiusWithView:self.btnUser value:self.btnUser.width/2];
        self.btnUser.layer.shadowOffset = CGSizeMake(2, 2);
        self.btnUser.layer.shadowColor = [UIColor grayColor].CGColor;
        self.btnUser.layer.shadowOpacity = .9;
        [self.contentView addSubview:self.btnUser];
    }
    if (!self.imgBubble) {
        self.imgBubble = [[UIImageView alloc] init];
        self.imgBubble.frame = CGRectMake(self.btnUser.right + 2, self.btnUser.top, self.contentView.frame.size.width - (self.btnUser.width + 15) * 2, 45);
        self.imgBubble.image = [GlobalObject resizableImage:[UIImage imageNamed:@"bubbleleft"]];
//        self.imgBubble.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.imgBubble];
    }
    if (!self.messageTextView) {
        self.messageTextView = [[UITextView alloc] initWithFrame:self.imgBubble.frame];
        self.messageTextView.userInteractionEnabled = NO;
        self.messageTextView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.messageTextView];
    }
    if (!self.activityStatus) {
        self.activityStatus = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        NSLog(@"%@", NSStringFromCGRect(self.activityStatus.frame));
        self.activityStatus.frame = CGRectMake(self.imgBubble.left + self.imgBubble.width + 5, (self.contentView.height - 20)/2, 20, 20);
        self.activityStatus.hidesWhenStopped = YES;
//        [self.activityStatus startAnimating];
        [self.contentView addSubview:self.activityStatus];
    }
    if (!self.webViewImage) {
        self.webViewImage = [[UIWebView alloc] initWithFrame:self.imgBubble.frame];
        self.webViewImage.scalesPageToFit = YES;
        [GlobalObject setRadiusWithView:self.webViewImage];
        // 禁止UIWebView的滚动
        for (id subview in self.webViewImage.subviews) {
            if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
                ((UIScrollView *)subview).scrollEnabled = NO;
            }
        }
        self.webViewImage.backgroundColor = [UIColor clearColor];
        self.webViewImage.opaque = NO;
        
        [self.imgBubble addSubview:self.webViewImage];
        [self.imgBubble sendSubviewToBack:self.webViewImage];
    }
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMsgModel:(MessageModel *)msgModel
{
    NSString *userid = msgModel.userModel.userID;
    NSString *message = msgModel.messageContent;
    
//    CGSize size = [message sizeWithFont:self.messageTextView.font constrainedToSize:CGSizeMake(self.imgBubble.width, 500) lineBreakMode:NSLineBreakByCharWrapping];
//    self.imgBubble.size = size;
//    NSLog(@"%f", self.imgBubble.size.width);
    BOOL isMe = YES;
    if ([userid isEqualToString:@"lipeng"]) {
        isMe = NO;
    }
    [self.btnUser setTitle:@"" forState:UIControlStateNormal];
    [self.btnUser setBackgroundImage:[UIImage imageNamed:@"users"] forState:UIControlStateNormal];

    if (isMe) {
        self.btnUser.right = self.contentView.frame.size.width - 10;
        UIImage *image = [GlobalObject resizableImage:[UIImage imageNamed:@"bubbleright"]];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.imgBubble.image = image;
        self.activityStatus.right = self.imgBubble.left - 5;
        self.messageTextView.textColor = [UIColor whiteColor];
//        self.imgBubble.right = self.contentView.width - self.btnUser.width - self.btnUser.origin.x - 5;
        
    }else
    {
        self.messageTextView.textColor = [UIColor blackColor];
        UIImage *image = [GlobalObject resizableImage:[UIImage imageNamed:@"bubbleleft"]];
//        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.imgBubble.image = image;
        self.btnUser.right = 10 + self.btnUser.width;
//        self.messageTextView.left = self.imgBubble.left + 5;// = 5;
    }
//    self.messageTextView.font = [UIFont systemFontOfSize:13.f];
    self.messageTextView.attributedText = [GlobalObject attributedStringWithText:msgModel.messageContent];
    self.messageTextView.font = [UIFont systemFontOfSize:15.f];
    CGSize size = [GlobalObject sizeWithText:message font:self.messageTextView.font];
//    if (size.width < 200) {
//        self.imgBubble.width = size.width;
//    }
    self.messageTextView.left = self.imgBubble.left + 10;
    self.messageTextView.width = self.imgBubble.width;
    self.messageTextView.height = size.height;
    if (size.height > 70.f) {
//        self.imgBubble.height = size.height;
//        self.imgBubble.height = size.height + 40;
        self.imgBubble.height = size.height + 25;
    }else
    {
        self.imgBubble.height = size.height + 15;
    }
   
//    self.imgBubble.height = size.height;
//    self.messageTextView.backgroundColor = [UIColor purpleColor];
    self.messageTextView.height = self.imgBubble.height;
//    UIWebView *webview;
//    webview = (UIWebView *)[self.imgBubble viewWithTag:111];
//    if (webview)
//    {
//        [webview removeFromSuperview]; //webview = nil;
//    }
    return;
    [self.webViewImage setHidden:YES];
    [self.messageTextView setHidden:YES];
    if (msgModel.MessageType == MessageTypePhoto) {
//        [self.messageTextView setHidden:YES];return;
            [self.webViewImage setHidden:NO];
            NSString *imgSource = msgModel.messagePhotos[0];
            NSData *imgData;
            
            [self.messageTextView setHidden:YES];
            if ([imgSource rangeOfString:@"gif"].length > 0) {
                NSString *imgFile = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"gif"];
                imgData = [NSData dataWithContentsOfFile:imgFile];
                UIImage *image = [UIImage imageWithData:imgData];
                [self.webViewImage loadData:imgData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
                self.imgBubble.height = image.size.height;
                self.webViewImage.size = CGSizeMake(self.imgBubble.width - 5, self.imgBubble.height - 5);
                self.webViewImage.left = 0; self.webViewImage.top = 2;
                self.webViewImage.right -= 1;

            }else if ([imgSource rangeOfString:@"png"].length > 0)
            {
                [self.webViewImage setHidden:YES];
                imgData = [NSData dataWithContentsOfFile:imgSource];
                UIImage *image = [UIImage imageNamed:imgSource];
                self.imageview.image = image;
                self.imageview.hidden = NO;
                self.imgBubble.backgroundColor = [UIColor redColor];
                self.imgBubble.height = image.size.height;
                self.imageview.frame = self.imgBubble.bounds;
//                NSLog(@"%@", NSStringFromCGSize(image.size));
//                [self.webViewImage loadData:[NSData dataWithData:UIImagePNGRepresentation(image)] MIMEType:@"image/png" textEncodingName:nil baseURL:nil];
//                self.imgBubble.height = image.size.height;
//                self.webViewImage.size = CGSizeMake(self.imgBubble.width - 5, self.imgBubble.height - 5);
//                self.webViewImage.left = 2.5; self.webViewImage.top = 2.5;
            }
    }else
    {
        [self.messageTextView setHidden:NO];
    }
}
@end
