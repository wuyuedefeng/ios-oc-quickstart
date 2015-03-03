//
//  UIViewController+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TXCategory)
#pragma mark -alertView弹出提示
- (void)messageBox:(NSString *)msg;
#pragma mark - 导航栏
- (void)tx_SetNavigationBarBackColor:(UIColor *)color;
#pragma mark -设置导航栏左侧按钮
- (void)tx_SetLeftBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)tx_SetLeftBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
- (void)tx_SetLeftBarButtonTextColor:(UIColor *)color;
#pragma mark -设置导航栏右侧按钮
- (void)tx_SetRightBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)tx_SetRightBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
#pragma mark -设置导航栏标题
- (void)tx_SetTitleText:(NSString *)title Color:(UIColor *)color font:(UIFont *)font;
- (void)tx_SetTitleView:(UIView *)view;
#pragma mark -设置导航栏 push后的返回按钮
- (void)tx_SetBackButtonWithWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)tx_SetBackButtonWithWithImage:(UIImage *)image highImage:(UIImage *)highImage  target:(id)target action:(SEL)action;

typedef void(^Block)(void);
- (void)tx_loadAnimation_MBProgressHUD:(Block)block;
- (void)tx_loadAnimation_MBProgressHUD:(Block)block finishDid:(Block)finishBlock;
@end
