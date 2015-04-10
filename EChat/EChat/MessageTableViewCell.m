//
//  MessageTableViewCell.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMessageModel:(id)messageModel
{
    msgModel = messageModel;
    self.lblTitle.text = msgModel.userModel.userName;
    self.imageview.image = nil;//[UIImage imageNamed:msgModel.userModel.userImage];
    self.textview.text = msgModel.messageContent;
    self.lblDate.text = msgModel.messageDate;
    NSAttributedString *attributedText = [GlobalObject attributedStringWithText:msgModel.messageContent];
    self.textview.attributedText = attributedText;

}
//- (void) setDetailContent
//{
//    NSArray *arrEmojiImages = [GlobalObject emojiImageArrayWithString:msgModel.messageContent];
//    
//}
@end
