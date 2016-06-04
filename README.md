# TQWStatusBarHUD
##状态栏指示器的显示效果
...objc
/**
 * 显示普通信息
 * @param tqw       文字
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
...
