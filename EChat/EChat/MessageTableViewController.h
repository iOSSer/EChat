//
//  MessageTableViewController.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageTableViewCell.h"
#import "MessageModel.h"

@interface MessageTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *arrMessageModels;
@end
