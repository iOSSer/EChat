//
//  AppDelegate.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "AppDelegate.h"
//#import <AVOSCloud/AVOSCloud.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
    tab.selectedIndex = 3;
    return YES;
    [AVOSCloud setApplicationId:AVOS_APP_ID
                      clientKey:AVOS_APP_KEY];
//    
//    AVObject *installation = [AVObject objectWithClassName:@"test"];
//    AVQuery *query = [AVQuery queryWithClassName:@"test"];
//    [query whereKey:@"testId" equalTo:@"1234567890"];
//    [query deleteAllInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        NSLog(@"DEL %d", succeeded);
//    }];
//    NSLog(@"%@", installation);
//    
//    if (![[installation objectForKey:@"testId"] isEqualToString:@"1234567890"]) {
//        [installation setObject:@"1234567890" forKey:@"testId"];
//        [installation setObject:@"iOS" forKey:@"deviceType"];
//        [installation saveInBackground];
//    }
    
    
    AVUser *userLi = [AVUser user];
    userLi.username = @"lipeng";
    userLi.password = @"123456";
//    [userLi signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        NSLog(@"sign %d", succeeded);
//    }];
    
//    AVUser *userLi1 = [AVUser user];
//    userLi1.username = @"lpassword";
//    userLi1.password = userLi1.username;
    
    [AVUser logInWithUsernameInBackground:userLi.username password:userLi.password block:^(AVUser *user, NSError *error) {
        if (!error) {
//            NSLog(@"user : %@", user);
        }
    }];
//    [userLi1 signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        NSLog(@"sign %d", succeeded);
//    }];
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
