//
//  FirstViewController.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "FirstViewController.h"
#define MY_NAME @"lipeng"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	picker = [[PopPickerView alloc] init];
    picker.frame = CGRectMake(0, self.view.bounds.size.height + picker.height, self.view.bounds.size.width, picker.height);
    picker.backgroundColor = [UIColor grayColor];
    [self.view addSubview:picker];
    [self getEmoteArray];
    
    NSString *str = @"我阿斯顿发顺丰是否[哈哈], adfsafs[嘻嘻]。阿[阿斯顿发生]";
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:str];
    
    //正则匹配要替换的文字的范围
    //正则表达式
    NSString * pattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    NSError *error = nil;
    NSRegularExpression * re = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (!re) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //通过正则表达式来匹配字符串
    NSArray *resultArray = [re matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    NSLog(@"resultArray : %@", resultArray);
    
    //用来存放字典，字典中存储的是图片和图片对应的位置
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    
    for(NSTextCheckingResult *match in resultArray) {
        //获取数组元素中得到range
        NSRange range = [match range];
        
        //获取原字符串中对应的值
        NSString *subStr = [str substringWithRange:range];
        
        for (int i = 0; i < face.count; i ++)
        {
            if ([face[i][@"text"] isEqualToString:subStr])
            {
                
                //face[i][@"gif"]就是我们要加载的图片
                //新建文字附件来存放我们的图片
                NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                //                    CGFloat n = 25/12;
                textAttachment.bounds = CGRectMake(textAttachment.bounds.origin.x, textAttachment.bounds.origin.y, 25, 25);
                
                //给附件添加图片
                textAttachment.image = [UIImage imageNamed:face[i][@"png"]];
                //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
                NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
                
                //把图片和图片对应的位置存入字典中
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                [imageDic setObject:imageStr forKey:@"image"];
                [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                
                //把字典存入数组中
                [imageArray addObject:imageDic];
                
            }
        }
    }
    
    //从后往前替换
    for (int i = imageArray.count -1; i >= 0; i--)
    {
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        //进行替换
        [attString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
        
    }
    
    self.textView.attributedText = attString;
    
    self.textView.font = [UIFont systemFontOfSize:27];
    NSLog(@"%@", NSStringFromCGSize(self.textView.size));
     NSDictionary *attribute = @{NSFontAttributeName: self.textView.font};
    CGSize size = [str boundingRectWithSize:CGSizeMake(200, 500) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    self.textView.height = size.height;
    self.textView.backgroundColor = [UIColor grayColor];
    NSLog(@"%@", NSStringFromCGSize(self.textView.size));
    NSLog(@"font %@", NSStringFromCGSize(self.textView.contentSize));
    
//    _session = [[AVSession alloc] init];
    
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.textView addGestureRecognizer:tap];
    [self uikitDynamics];
}
- (void)tapped:(UIPanGestureRecognizer *)panGesture
{
    UIGestureRecognizerState state = panGesture.state;
    if (state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [panGesture velocityInView:self.view];
        push.pushDirection = CGVectorMake(velocity.x / 1000, velocity.y / 1000);
        push.active = YES;
    }
}
- (void) uikitDynamics
{
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] initWithItems:@[self.textView]];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.textView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collision];
    
    push = [[UIPushBehavior alloc] initWithItems:@[self.textView] mode:UIPushBehaviorModeInstantaneous];
    push.pushDirection = CGVectorMake(1.0f, 0);
    [animator addBehavior:push];
}
- (void) getEmoteArray
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"EmoteList" ofType:@"plist"];
    face = [[NSArray alloc] initWithContentsOfFile:file];
    NSLog(@"%@", face);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender {
    
//    [_session sendMessage:[NSString stringWithFormat:@"{\"dn\":\"%@\", \"msg\":\"%@\"}", MY_NAME, message] isTransient:NO toPeerIds:_session.getAllPeers];
    return;
    
    
    
    
    if (picker.frame.origin.y != [UIScreen mainScreen].bounds.size.height + picker.height) {
        
        [picker hide:YES];
    }else
    {
        [picker show:YES];
    }
}
@end
