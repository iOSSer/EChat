//
//  MessageTableViewController.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "MessageTableViewController.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated
{
    
//    self.tabBarController.selectedIndex = 3;
//    return;
//    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"chat"] animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrMessageModels = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<2; i++) {
        UserModel *user = [[UserModel alloc] init];
        user.userName = [NSString stringWithFormat:@"用户%d", i + 1];
        user.userImage = @"first";
        MessageModel *msgModel = [[MessageModel alloc] init];
        msgModel.userModel = user;
        msgModel.messageContent = @"我阿斯顿发顺丰是否[哈哈], adfsafs[嘻嘻]。阿[阿斯顿发生]";
        msgModel.messageDate = [NSString stringWithFormat:@"%@", [NSDate date]];
        [self.arrMessageModels addObject:msgModel];
    }
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"message"];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.arrMessageModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil] lastObject];
    }
    MessageModel *msgModel = self.arrMessageModels[indexPath.row];
    cell.messageModel = msgModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"chat"] animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"%@", [segue destinationViewController]);
    
    [self.navigationController pushViewController:[segue destinationViewController] animated:YES];
}
*/

@end
