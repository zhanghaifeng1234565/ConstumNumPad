//
//  ConstumNumKeyBoardView.m
//  ConstumNumberKeyboard
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ConstumNumKeyBoardView.h"

#import "UIImage+ImageExtension.h"

@interface ConstumNumKeyBoardView ()

/**
 按钮内容数组
 */
@property (nonatomic, strong) NSArray *btnContentArr;

/**
  按钮的宽度
 */
@property (nonatomic, assign) CGFloat buttonWidth;

/**
 自定义按钮高度
 */
@property (nonatomic,assign) CGFloat buttonHeight;

/**
 自定义按钮间距
 */
@property (nonatomic,assign) CGFloat buttonMargin;

/**
 键盘显示的列数
 */
@property (nonatomic,assign) int clumCount;

/**
 键盘内容数组
 */
@property (nonatomic, strong) NSMutableArray *keyBoardContentArr;


@end

@implementation ConstumNumKeyBoardView

#pragma mark -- lazyload
- (NSArray *)btnContentArr {
    if (!_btnContentArr) {
        _btnContentArr = [[NSArray alloc] initWithObjects:
                          @"1",
                          @"2",
                          @"3",
                          @"4",
                          @"5",
                          @"6",
                          @"7",
                          @"8",
                          @"9",
                          @"确定",
                          @"0",
                          @"删除",nil];
        
    }
    return _btnContentArr;
}

- (NSMutableArray *)keyBoardContentArr {
    if (!_keyBoardContentArr) {
        _keyBoardContentArr = [[NSMutableArray alloc] init];
    }
    return _keyBoardContentArr;
}

- (instancetype)initKeyboardButtonHeight:(CGFloat)buttonHeight withButtonMargin:(CGFloat)buttonMargin withClumCount:(int)clumCount withKeyBoardContentArr:(NSMutableArray *)keyBoardContentArr {
    if (self = [super init]) {
        
        self.buttonHeight = buttonHeight;
        self.buttonMargin = buttonMargin;
        self.clumCount = clumCount;
        self.keyBoardContentArr = keyBoardContentArr;
        
        self.buttonWidth = ([UIScreen mainScreen].bounds.size.width-(self.buttonMargin*(self.clumCount+1)))/self.clumCount;
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self constumBtn];
        [self layoutSubviews];
        
    }
    return self;
}
#pragma mark -- 自定义按钮
- (void)constumBtn {
    
    if (self.keyBoardContentArr.count>0) {
        for (int i = 0; i < self.keyBoardContentArr.count; i++) {
            
            // 第几行
            int row = i/self.clumCount;
            // 第几列
            int clum = i%self.clumCount;
            
            UIButton *btn = [[UIButton alloc] init];
            [self addSubview:btn];
            btn.frame = CGRectMake(clum*self.buttonMargin+self.buttonMargin+clum*self.buttonWidth, row*self.buttonMargin+self.buttonMargin+row*self.buttonHeight, self.buttonWidth, self.buttonHeight);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 2.0f;
            btn.layer.borderWidth = 0.5f;
            btn.layer.borderColor = [UIColor brownColor].CGColor;
            btn.tag = 101+i;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            [btn setTitle:self.keyBoardContentArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:(UIControlStateHighlighted)];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    } else {
        for (int i = 0; i < self.btnContentArr.count; i++) {
            
            // 第几行
            int row = i/self.clumCount;
            // 第几列
            int clum = i%self.clumCount;
            
            UIButton *btn = [[UIButton alloc] init];
            [self addSubview:btn];
            btn.frame = CGRectMake(clum*self.buttonMargin+self.buttonMargin+clum*self.buttonWidth, row*self.buttonMargin+self.buttonMargin+row*self.buttonHeight, self.buttonWidth, self.buttonHeight);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 2.0f;
            btn.layer.borderWidth = 0.5f;
            btn.layer.borderColor = [UIColor brownColor].CGColor;
            btn.tag = 101+i;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            [btn setTitle:self.btnContentArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:(UIControlStateHighlighted)];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}
#pragma mark -- 按钮点击调用
- (void)btnClick:(UIButton *)sender {
    if (self.keyBoard) {
        self.keyBoard(sender);
    }
}
#pragma mark -- 重新布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    if (self.self.keyBoardContentArr.count>0) {
        frame.size.height = ((self.keyBoardContentArr.count-1)/self.clumCount+1)*(self.buttonHeight+self.buttonMargin)+self.buttonMargin;
    } else {
        frame.size.height = ((self.btnContentArr.count-1)/self.clumCount+1)*(self.buttonHeight+self.buttonMargin)+self.buttonMargin;
    }
    self.frame = frame;
   
}

@end
