//
//  GlobalObject.h
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface GlobalObject : NSObject
{
//    NSArray *arrEmoji;
}
@property (nonatomic, strong) NSArray *arrEmoji;

+ (NSAttributedString *) attributedStringWithText:(NSString *)str;
+ (UIImage *)resizableImage:(UIImage *)image;
+ (void) setRadiusWithView:(UIView *)view;
+ (void) setRadiusWithView:(UIView *)view value:(CGFloat) value;
+ (CGSize) sizeWithText:(NSString *) text font:(UIFont *)font;
+ (NSData *) dataWithUrlString:(NSString *) url;
+ (NSString *)MIMETypeForImageData:(NSData *)data;
+ (NSString *) getDateString;
@end
