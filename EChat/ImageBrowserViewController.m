//
//  ImageBrowserViewController.m
//  EChat
//
//  Created by pg on 14-10-15.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "ImageBrowserViewController.h"

@interface ImageBrowserViewController ()

@end

@implementation ImageBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollview = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollview.pagingEnabled = YES;
    self.scrollview.alwaysBounceVertical = NO;
    self.scrollview.alwaysBounceHorizontal = NO;
    self.scrollview.tag = 111;
    self.scrollview.top -= 44;
    self.scrollview.height += 44;
    [self.view addSubview:self.scrollview];
    self.scrollview.delegate = self;
//    self.scrollview.backgroundColor = [UIColor redColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)setArrImages:(NSArray *)arrImages
{
//    NSLog(@"arrImages %@ %d", arrImages, arrImages.count);
    CGSize size = CGSizeMake(MAIN_SCREEN.width * arrImages.count,self.view.height);
    self.scrollview.contentSize = size;
//    NSLog(@"%@", NSStringFromCGSize(size));
    for (int i=0; i<arrImages.count; i++) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(MAIN_SCREEN.width * i, 0, MAIN_SCREEN.width, MAIN_SCREEN.height)];
        scroll.bouncesZoom = YES;
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(MAIN_SCREEN.width * i, 0, MAIN_SCREEN.width, MAIN_SCREEN.height)];
        imageview.frame = scroll.bounds;
        imageview.image = [UIImage imageNamed:arrImages[i]];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [scroll addSubview:imageview];
        imageview.tag = i;
        CGFloat minimumScale = scroll.frame.size.width/imageview.frame.size.width;
        scroll.minimumZoomScale = minimumScale;
        scroll.zoomScale = minimumScale;
        scroll.maximumZoomScale = imageview.image.scale * 2;
        scroll.delegate = self;
//        imageview.clipsToBounds = YES;
        [self.scrollview addSubview:scroll];
    }
    self.scrollview.contentSize = CGSizeMake(self.scrollview.contentSize.width, 0);
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%f", scrollView.contentOffset.x);
    NSInteger index = scrollView.contentOffset.x/MAIN_SCREEN.width;
    NSLog(@"%d", index);
//    if (scrollView.tag == 111) {
//        return;
//    }
//    for (UIImageView *view in scrollView.subviews) {
//        scrollView.zoomScale = view.image.scale;
//    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    for (UIImageView *view in scrollView.subviews) {
        return view;
    }
    return nil;
}
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    self.scrollview.contentOffset = CGPointMake(currentIndex * MAIN_SCREEN.width, 0);
}


@end
