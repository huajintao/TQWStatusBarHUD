//
//  ViewController.m
//  TQWStatusBarHUD
//
//  Created by 陶巧文 on 16/6/3.
//  Copyright © 2016年 陶巧文. All rights reserved.
//

#import "ViewController.h"
#import "TQWStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)success:(id)sender {
    
    [TQWStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)filar:(id)sender {
    [TQWStatusBarHUD showError:@"加载失败"];
}
- (IBAction)dismis:(id)sender {
    [TQWStatusBarHUD dismiss];
}
- (IBAction)loading:(id)sender {
    [TQWStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)nomoul:(id)sender {
    [TQWStatusBarHUD showMessage:@"显示普通信息"];
}
- (IBAction)userSender:(id)sender {
    [TQWStatusBarHUD showMessage:@"自定义显示信息" image:nil];
}

@end
