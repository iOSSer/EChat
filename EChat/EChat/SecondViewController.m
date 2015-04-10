//
//  SecondViewController.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arrMacs = [NSArray arrayWithObjects:@"MacBook Air", @"MacBook Pro", @"iMac", @"Mac mini", @"Mac Pro", nil];
    self.arrPads = [NSArray arrayWithObjects:@"iPad 1", @"iPad 2", @"iPad 3", @"iPad 4", @"iPad Pro", @"iPad mini", @"iPad Air", @"iPad Air 2", nil];
    self.arrPhones = [NSArray arrayWithObjects:@"iPhone 3GS", @"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5S", @"iPhone 6", @"iPhone 6 Plus", nil];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:self.arrMacs, @"iMac", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:self.arrPads, @"iPad", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:self.arrPhones, @"iPhone", nil];
    self.arrAllDevices = [NSArray arrayWithObjects:dic1, dic2, dic3, nil];
    
    self.pickerview = [self sharePicker];
    self.pickerview.backgroundColor = [UIColor whiteColor];
    self.pickerview.delegate = self;
    self.pickerview.frame = CGRectMake(0, self.view.height + 216, 320, 216);
    [self.view addSubview:self.pickerview];
    
    [self.view.subviews[1] setHidden:YES];
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.borderColor = btn.tintColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:btn.tintColor forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [GlobalObject setRadiusWithView:btn];
    btn.frame = CGRectMake(10, 100, 200, 40);
    btn.center = self.view.center;
    [self.view addSubview:btn];
}
- (id) sharePicker
{
    
    
    dispatch_once_t t;
    dispatch_once(&t, ^{
        self.pickerview = [[UIPickerView alloc] init];
    });

    return self.pickerview;
}
- (void) showPicker
{
    
    self.pickerview.top = self.pickerview.top == self.view.height ? self.view.height - self.pickerview.height : self.view.height;
    self.tabBarController.tabBar.hidden = self.pickerview.top == self.view.height - self.pickerview.height ? YES : NO;
    
    [self.pickerview selectRow:2 inComponent:0 animated:YES];
    [self.pickerview selectRow:[self.arrAllDevices[2] allValues].count inComponent:1 animated:YES];
    [self.pickerview reloadComponent:1];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rows;
    NSInteger row = [pickerView selectedRowInComponent:0];
    NSArray *arrSubDevices = [self.arrAllDevices[row] allValues][0];
    switch (component) {
        case 0:
            rows = self.arrAllDevices.count;
            break;
        case 1:
            rows = arrSubDevices.count;
            break;
        default:
            break;
    }
    return rows;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    NSDictionary *dic;
    NSArray *arrSubDevices;
    NSInteger selectrow = [pickerView selectedRowInComponent:0];
    switch (component) {
        case 0:
            dic = self.arrAllDevices[row];
            title = dic.allKeys[0];
            break;
        case 1:
            arrSubDevices = [self.arrAllDevices[selectrow] allValues][0];
            title = arrSubDevices[row];
            break;
        default:
            break;
    }
    
    return title;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        [pickerView reloadComponent:1];
    }
}

@end
