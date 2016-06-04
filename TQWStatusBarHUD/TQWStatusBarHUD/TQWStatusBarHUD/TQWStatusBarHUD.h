//
//  TQWStatusBarHUD.h
//  TQWStatusBarHUD
//
//  Created by 陶巧文 on 16/6/3.
//  Copyright © 2016年 陶巧文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQWStatusBarHUD : NSObject
/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+(void)showMessage:(NSString *)tqw image:(UIImage *)image;
/**
 * 显示普通信息
 */
+(void)showMessage:(NSString *)tqw;
/**
 * 显示成功信息
 */
+(void)showSuccess:(NSString *)tqw;
/**
 * 显示失败信息
 */
+(void)showError:(NSString *)tqw;
/**
 * 显示正在处理的信息
 */
+(void)showLoading:(NSString *)tqw;
/**
 * 隐藏
 */
+(void)dismiss;

@end
