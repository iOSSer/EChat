//
//  SecondViewController.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, strong) NSArray *arrAllDevices;
@property (nonatomic, strong) NSArray *arrMacs;
@property (nonatomic, strong) NSArray *arrPads;
@property (nonatomic, strong) NSArray *arrPhones;

@property (nonatomic, strong) UIPickerView *pickerview;
@end
