//
//  MessageModel.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

//typedef NS_ENUM(NSInteger, UITableViewStyle) {
//    UITableViewStylePlain,                  // regular table view
//    UITableViewStyleGrouped                 // preferences style table view
//};

typedef NS_ENUM (NSInteger, MessageType)
{
    MessageTypeText,
    MessageTypePhoto
};

#import <Foundation/Foundation.h>
#import "UserModel.h"


@interface MessageModel : NSObject

@property (nonatomic, assign) MessageType MessageType;
@property (nonatomic, strong) NSArray *messagePhotos;

@property (nonatomic, strong) UserModel *userModel;
@property (nonatomic, copy) NSString *messageContent;
@property (nonatomic, copy) NSString *messageDate;
@property (nonatomic, assign) BOOL isRead;

@end
