//
//  UIImage+ImageExtension.m
//  ConstumNumberKeyboard
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "UIImage+ImageExtension.h"

@implementation UIImage (ImageExtension)

+ (UIImage *)createImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}

@end
