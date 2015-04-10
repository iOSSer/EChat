//
//  ChatViewController.m
//  EChat
//
//  Created by pg on 14-10-14.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "ChatViewController.h"
#define testid @"lipeng"
@interface ChatViewController ()

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
- (void) initSubviews
{
    badge = 0;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.height -= 40;
    
    self.chatToolView = [[ChatMessageToolView alloc] init];
    self.chatToolView.frame = CGRectMake(0, 0, MAIN_SCREEN.width, 40);
    self.chatToolView.top = self.tableView.height;
    self.chatToolView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.chatToolView];
    __weak typeof(self) weakSelf = self;
    self.chatToolView.btnBlock = ^()
    {
        [weakSelf send];
    };
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    char name[2];
    scanf("%s", name);
     [self initSubviews];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    self.arrMessages = [NSMutableArray arrayWithCapacity:0];
    // @"你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄] \n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄] \n \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄] \n \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[😄] ";
    NSString *str = @"你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[] \n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]\n sdfs we \n wer \n你是个坏人[哈哈], adfsafs[嘻嘻]。阿[]";
    for (int i=0; i<15; i++) {
        MessageModel *msgModel = [[MessageModel alloc] init];
        UserModel *userModel = [[UserModel alloc] init];
        if (i % 2 == 0) {
            userModel.userID = @"sd";
            msgModel.messageContent = @"[哈哈], adfsafs[嘻嘻]。[阿斯顿发生]sd";
            msgModel.MessageType = MessageTypeText;
            msgModel.messagePhotos = @[@"0.png"];
            
        }else
        {
            
            userModel.userID = testid;[NSString stringWithFormat:@"好友%d", i + 100];
            msgModel.messageContent = str;//@"[哈哈], adfsafs[嘻嘻]。\n[哈哈],\n[嘻嘻]\n我我是大法师\naaa\nasfd\nasfd\nerw\nsdfsd";
            msgModel.MessageType = MessageTypeText;
            //            msgModel.messagePhotos = @[@"6.gif"];
            
        }
        //        if (i % 2 == 0) {
        //            msgModel.MessageType = MessageTypePhoto;
        //            msgModel.messagePhotos = [NSArray arrayWithObjects:@"http://subject.csdn.net/top30/images/logo_cocoachina.gif", nil];
        //        }else
        //        {
        //            msgModel.MessageType = MessageTypeText;
        //            msgModel.messagePhotos = nil;
        //        }
        //        if ([userModel.userName isEqualToString:testid]) {
        //            msgModel.MessageType = MessageTypePhoto;
        ////            userModel.userID = @"nolipeng";
        //            userModel.userName = NSStringEncodingErrorKey;
        //            userModel.userImage = nil;
        //            msgModel.messageContent = userModel.userID;
        //            msgModel.messagePhotos = @[@"5.png"];
        //        }else
        //        {
        //            msgModel.MessageType = MessageTypePhoto;
        //            msgModel.messagePhotos = @[@"1.png"];
        //        }
        
        msgModel.userModel = userModel;
        msgModel.messageDate = [NSString stringWithFormat:@"%@", [NSDate date]];
        
        [self.arrMessages addObject:msgModel];
    }
//    session = [[AVSession alloc] init];
//    session.sessionDelegate = self;
//    [session open:[AVUser currentUser].username withPeerIds:@[@"lpassword"]];
    
//    NSArray  *arrPeers = [session getAllPeers];
//    NSLog(@"arrPeers %@", arrPeers);
//    arrPeers = [session getOnlinePeers];
//    
//    NSLog(@"arrPeers one %@", arrPeers);
//    NSString *peerid = [session getSelfPeerId];
//    NSLog(@"peerid %@", peerid);
//    if (session.isOpen) {
//        NSLog(@"isopen");
//    }else
//    {
//        NSLog(@"no open");
//    }
}
-(void) send
{
//    [session sendMessage:@"hello" isTransient:NO toPeerIds:@[@"lpassword"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMessages.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *msgModel = self.arrMessages[indexPath.row];
    CGSize size = [GlobalObject sizeWithText:msgModel.messageContent font:[UIFont systemFontOfSize:15.f]];
    CGFloat height = 70.;
//    NSString *imgSource = msgModel.messagePhotos[0];
//    NSData *imgData;
//    //    if ([imgSource rangeOfString:@"gif"].length > 0) {
//    //                UIImage *image = [UIImage imageNamed:imgSource];
//    NSString *imgFile = [[NSBundle mainBundle]pathForResource:@"0" ofType:@"png"];
////    NSLog(@"%@", imgSource);
//    imgData = [NSData dataWithContentsOfFile:imgFile];
//    UIImage *image = [UIImage imageWithData:imgData];
////    NSLog(@"image%f", image.size.height);
//    size.height = image.size.height;
    //    }
    
    
    //    NSData *data = [GlobalObject dataWithUrlString:msgModel.messagePhotos[0]];
    //    UIImage *image = [UIImage imageWithData:data scale:100];
    //    NSLog(@"imge si %@", NSStringFromCGSize(image.size));
    //    if (msgModel.MessageType == MessageTypePhoto) {
    //        height = image.size.height;
    //    }
    if (size.height > height) {
        height = size.height + 40;
    }
//    NSLog(@"h : %f", height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chat"];
    if (!cell) {
        //        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChatTableViewCell" owner:self options:nil] lastObject];
        cell = [[ChatMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chat"];
    }
    //    cell.backgroundColor = [UIColor clearColor];
    MessageModel *msgModel = [self.arrMessages objectAtIndex:indexPath.row];
    cell.msgModel = msgModel;
    UIView *view;
    if (msgModel.MessageType == MessageTypePhoto) {
        if ([cell.imgBubble viewWithTag:111]) {
            view = [cell.imgBubble viewWithTag:111];
        }
    }else
    {
        if (view) {
            [view removeFromSuperview];view = nil;
        }
    }
    //    cell.msgModel = [self.arrMessages objectAtIndex:indexPath.row];
    //    [cell.btnUser setBackgroundImage:[UIImage imageNamed:@"second"] forState:UIControlStateNormal];
    //    if ([msgModel.userModel.userID  isEqual: testid]) {
    //        cell.btnUser.right = cell.contentView.width - 10;
    //    }else
    //    {
    //        cell.btnUser.right = 10 + cell.btnUser.width;
    //    }
    //    cell.textLabel.text = @"sdf";
    //    cell.
    return cell;
}
//- (void)onSessionOpen:(AVSession *)session
//{
//    NSLog(@"%s,", __FUNCTION__);
//}
//- (void)onSessionPaused:(AVSession *)session
//{
//    
//}
//- (void)onSessionResumed:(AVSession *)seesion
//{
//    
//}
//- (void)onSessionMessage:(AVSession *)session message:(NSString *)message peerId:(NSString *)peerId
//{
////    NSLog(@"onSessionMessage");
////    badge ++;
////    [self.tabBarController.tabBarItem.badgeValue stringByAppendingString:message];
////    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];
//}
//- (void)onSessionMessageSent:(AVSession *)session message:(NSString *)message toPeerIds:(NSArray *)peerIds
//{
//    NSLog(@"sent %@ user %@", message, peerIds);
//}
//- (void)onSessionMessageFailure:(AVSession *)session message:(NSString *)message toPeerIds:(NSArray *)peerIds
//{
//    
//}
//- (void)onSessionStatusOnline:(AVSession *)session peers:(NSArray *)peerIds
//{
//    
//}
//- (void)onSessionStatusOffline:(AVSession *)session peers:(NSArray *)peerId
//{
//    
//}
//- (void)onSessionError:(AVSession *)session withException:(NSException *)exception
//{
//    
//}

@end
