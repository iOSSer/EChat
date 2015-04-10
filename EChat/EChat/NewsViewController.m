//
//  NewsViewController.m
//  EChat
//
//  Created by pg on 14-10-13.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)LoginWithAccount:(NSString *) account password:(NSString *) password completion:(void (^) (BOOL success)) completion
{
    if ([account isEqualToString:password]) {
        completion(YES);
    }else
    {
        completion(NO);
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [self LoginWithAccount:@"1111" password:@"111" completion:^(BOOL success) {
        if (success) {
            NSLog(@"login successful");
        }else
        {
            NSLog(@"login failed");
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"News";
    test = @"你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[] \n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]";
    tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    tableview.separatorColor = [UIColor purpleColor];
    arrSources = [NSMutableArray arrayWithCapacity:0];

    for (int i=0; i<10; i++) {
        MessageModel *mModel = [[MessageModel alloc] init];
        mModel.messageContent = test;
        mModel.messagePhotos = nil;
//        if (i < 2) {
//            NSArray *array = @[@"1.png", @"2.png", @"3.png", @"4.png", @"5.png", @"6.gif"];
//            mModel.messagePhotos = array;
//        }
        [arrSources addObject:mModel];
    }
    
    self.tabBarController.tabBar.hidden = NO;
    imageBrowser = [[ImageBrowserViewController alloc] init];
    
    
    
    
    return;
//    AVUser *user = [AVUser currentUser];
//    
//    AVUser *other = [AVUser user];
////    other.username = @"other";
////    other.password = @"123456";
////    [other signUp];
//    AVQuery *query = [AVUser query];
//    [query whereKey:@"username" equalTo:@"other"];
//    other = (AVUser *)[query getFirstObject];
//    NSLog(@"id %@", other.objectId);
//    [user follow:other.objectId andCallback:^(BOOL succeeded, NSError *error) {
//        NSLog(@"%d", succeeded);
//    }];
//    [user unfollow:other.objectId andCallback:^(BOOL succeeded, NSError *error) {
//        NSLog(@"un %d", succeeded);
//    }];
    for (int i=0; i<6; i++) {
        NSString *imagename = [NSString stringWithFormat:@"%d.png", i+1];
        if (i == 5) {
            imagename = [NSString stringWithFormat:@"%d.gif",i];
        }
//        UIImage *image = [UIImage imageNamed:imagename];
        NSData *data = [NSData dataWithContentsOfFile:imagename];
        NSLog(@"%@", data);
//        AVFile *file = [AVFile fileWithName:imagename data:data];
//        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            NSLog(@"succ %d", succeeded);
//        }];
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat defaultHeight = 107.;
    CGSize size = [GlobalObject sizeWithText:test font:[UIFont systemFontOfSize:15.f]];
    
    if (size.height > defaultHeight) {
        defaultHeight = size.height + 20;
//        defaultHeight += 20;
//        defaultHeight += 40;
    }
//    CGFloat imagecontentHeight;
//    
//    MessageModel *mModel = arrSources[indexPath.row];
//    if (mModel.messagePhotos) {
//        NSInteger imageMOthree = mModel.messagePhotos.count / 3;
//        
//        if (imageMOthree > 2 && imageMOthree <= 3) {
//            
//            imagecontentHeight = 90 * imageMOthree;
//            
//        }else if (imageMOthree > 1 && imageMOthree <= 2)
//        {
//            imagecontentHeight = 90 * imageMOthree;
//        }
//        defaultHeight += imagecontentHeight;
//    }
    return defaultHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"news"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc] init];
    }
    MessageModel *mModel = arrSources[indexPath.row];
    NSAttributedString *attributedText = [GlobalObject attributedStringWithText:mModel.messageContent];
    cell.contentTextView.attributedText = attributedText;
    cell.lblDatetime.text = [GlobalObject getDateString];
    cell.lblFromDevice.text = @"来自MAC";
    NSLog(@"%f", cell.contentTextView.width);
    [cell setContentWithMessageModel:mModel];
//    cell.imgClickedBlock = ^(NSDictionary *)
//    {};
    //    cell.contentTextView.backgroundColor = [UIColor redColor];
//    if (indexPath.row == 0) {
//        UIView *imgBgView = [[UIView alloc] init];
//        imgBgView.frame = CGRectMake(5, cell.contentTextView.top + cell.contentTextView.height, cell.contentView.width - 10, 150);
//        imgBgView.backgroundColor = [UIColor lightGrayColor];
//        [cell.contentView addSubview:imgBgView];
//    }
//    __weak typeof(self) weakSelf = self;
//    [cell imageClickedBlock:^(NSInteger currentIndex, NSArray *arrImages) {
//        [weakSelf pushToImageBrowserView:currentIndex images:arrImages];
//    }];
    
    __block typeof(cell) selfcell = cell;
    cell.imgClickedBlock = ^()
    {
        [self imageClickedInCell:selfcell];
    };
    
    return cell;
}
- (void) pushToImageBrowserView:(NSInteger)currentIndex images:(NSArray *)arrImages
{
    imageBrowser.arrImages = arrImages;
    imageBrowser.currentIndex = currentIndex;
    NSLog(@"%@",imageBrowser);
//    __block typeof(self) weakSelf = self;
    [self.navigationController pushViewController:imageBrowser animated:NO];
}
- (void) imageClickedInCell:(NewsTableViewCell *)cell
{
//    NSLog(@"%d", cell.currentImgIndex);
//    NSLog(@"%@", cell.arrImages);
    imageBrowser.arrImages = cell.arrImages;
    imageBrowser.currentIndex = cell.currentImgIndex;
    [self.navigationController pushViewController:imageBrowser animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
