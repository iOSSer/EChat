//
//  NewsViewController.h
//  EChat
//
//  Created by pg on 14-10-13.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTableViewCell.h"
#import "ImageBrowserViewController.h"
@interface NewsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *arrSources;
    UITableView *tableview;
    NSString *test;
    ImageBrowserViewController *imageBrowser;
}
@end
