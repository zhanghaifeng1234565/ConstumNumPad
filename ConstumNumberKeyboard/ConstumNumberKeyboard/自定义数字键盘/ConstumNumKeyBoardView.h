//
//  ConstumNumKeyBoardView.h
//  ConstumNumberKeyboard
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

/* 使用
 
 NSMutableArray *arrM = [[NSMutableArray alloc] initWithObjects:
 @"一",
 @"二",
 @"三",
 @"四",
 @"五",
 @"六",
 @"七",
 @"八",
 @"九",
 @"初一",
 @"初二",
 @"初三",
 @"完成",
 @"零",
 @"删除",nil];
 
 ConstumNumKeyBoardView *keyboardView = [[ConstumNumKeyBoardView alloc] initKeyboardButtonHeight:35 withButtonMargin:15 withClumCount:3 withKeyBoardContentArr:arrM];
 
 keyboardView.keyBoard = ^(UIButton *sender) {
 NSLog(@"text=%@", sender.titleLabel.text);
 if ([sender.titleLabel.text isEqualToString:@"删除"]) {
 [self.numberTextFiled changetext:@""];
 }
 else if ([sender.titleLabel.text isEqualToString:@"完成"]) {
 [self.view endEditing:YES];
 } else {
 [self.numberTextFiled changetext:sender.titleLabel.text];
 }
 
 };
 self.numberTextFiled.inputView = keyboardView;
 */

#import <UIKit/UIKit.h>
#import "UITextField+TextFiledExtension.h"

typedef void(^keyBoardBlock)(UIButton *sender);

@interface ConstumNumKeyBoardView : UIView

/**
  自定义键盘按钮点击回调
 */
@property (nonatomic, copy) keyBoardBlock keyBoard;

/**
 初始化自定义键盘视图

 @param buttonHeight  按钮的高度
 @param buttonMargin 按钮的间距
 @param clumCount  按钮的列数
 @param keyBoardContentArr  自定义键盘的数组
 @return  自定义键盘
 */
- (instancetype)initKeyboardButtonHeight:(CGFloat)buttonHeight withButtonMargin:(CGFloat)buttonMargin withClumCount:(int)clumCount withKeyBoardContentArr:(NSMutableArray *)keyBoardContentArr;


@end
