//
//  UIImage+ImageExtension.h
//  ConstumNumberKeyboard
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageExtension)

/**
 给背景图片添加颜色

 @param color  要添加的颜色
 @return  image 对象
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
