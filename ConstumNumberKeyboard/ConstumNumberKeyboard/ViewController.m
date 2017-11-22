//
//  ViewController.m
//  ConstumNumberKeyboard
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ViewController.h"

#import "ConstumNumKeyBoardView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
