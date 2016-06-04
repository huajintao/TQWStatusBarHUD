//
//  TQWStatusBarHUD.m
//  TQWStatusBarHUD
//
//  Created by 陶巧文 on 16/6/3.
//  Copyright © 2016年 陶巧文. All rights reserved.
//

#import "TQWStatusBarHUD.h"

#define TQWMessageFont [UIFont systemFontOfSize:12]
/** 消息的停留时间 */
static CGFloat const TQWMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const TQWAnimationDuration = 0.25;

@implementation TQWStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
static NSTimer *timer_;
+(void)setupWindow{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    //简单动画
    frame.origin.y = 0;
    [UIView animateWithDuration:TQWAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+(void)showMessage:(NSString *)tqw image:(UIImage *)image{
    
    [timer_ invalidate];
    
    [self setupWindow];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setTitle:tqw forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (image) {
        
        [button setImage:image forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    [button.titleLabel setFont:TQWMessageFont];
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:TQWMessageDuration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    
}
/**
 * 显示普通信息
 */
+(void)showMessage:(NSString *)tqw{
    [self showMessage:tqw image:nil];
}
/**
 * 显示成功信息
 */
+(void)showSuccess:(NSString *)tqw{
    [self showMessage:tqw image:[UIImage imageNamed:@"TQWStatusBarHUD.bundle/success"]];
}
/**
 * 显示失败信息
 */
+(void)showError:(NSString *)tqw{
    [self showMessage:tqw image:[UIImage imageNamed:@"TQWStatusBarHUD.bundle/error"]];
}
/**
 * 显示正在处理的信息
 */
+(void)showLoading:(NSString *)tqw{
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    UILabel *lable = [[UILabel alloc] init];
    lable.font = TQWMessageFont;
    lable.frame = window_.frame;
    [lable setTextAlignment:NSTextAlignmentCenter];
    [lable setTextColor:[UIColor whiteColor]];
    lable.text = tqw;
    [window_ addSubview:lable];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activity startAnimating];
    CGFloat textW = [tqw sizeWithAttributes:@{NSFontAttributeName:TQWMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - textW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    activity.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activity];
    
}
/**
 * 隐藏
 */
+(void)dismiss{
    
    [UIView animateWithDuration:TQWAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
        timer_ = nil;
    }];
}

@end
