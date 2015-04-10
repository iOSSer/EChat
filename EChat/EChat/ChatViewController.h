//
//  ChatViewController.h
//  EChat
//
//  Created by pg on 14-10-14.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessageCell.h"
#import "ChatMessageToolView.h"
@interface ChatViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
//    AVSession *session;
    NSInteger badge;
}

@property (nonatomic, strong) ChatMessageToolView *chatToolView;
@property (nonatomic, strong) NSMutableArray *arrMessages;
@property (nonatomic, strong) UITableView *tableView;
@end
