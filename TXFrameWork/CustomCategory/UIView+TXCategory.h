//
//  UIView+TXCategory.h
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
typedef enum {
	TXUIViewAlignmentUnchanged,
	TXUIViewAlignmentLeftAligned,
	TXUIViewAlignmentRightAligned,
	TXUIViewAlignmentCenter
} TXUIViewAlignment;
@interface UIView (TXCategory)
#pragma mark - 设置x y width height 。。。
- (void) setX:(CGFloat)x;
- (void) setY:(CGFloat)y;
- (void) setWidth:(CGFloat)width;
- (void) setHeight:(CGFloat)height;
- (void) setOrigin:(CGPoint)origin;
- (void) setSize:(CGSize)size;


- (CGFloat) x;
- (CGFloat) y;
- (CGFloat) width;
- (CGFloat) height;
- (CGPoint) origin;
- (CGSize)  size;

//===========================================================
#pragma mark -
#pragma mark Position Views
//==//=========================================================
//=ws=//
- (void)positionUnderView_boundsEqual:(UIView *)view padding:(CGFloat)padding;
- (void)positionUnderView_WidthEqual:(UIView *)view height:(CGFloat)height padding:(CGFloat)padding;
// positions current view directly under the given view
- (void)positionUnderView:(UIView *)view;
// positions current view under a given view with a specified y-padding
- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding;

// positions current view directly under the given view and aligns horizontally
- (void)positionUnderView:(UIView *)view alignment:(TXUIViewAlignment)alignment;
// positions current view under a given view with a specified y-padding and aligns horizontally
- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(TXUIViewAlignment)alignment;

// adds the subview as a subview of the current view and centers it
- (void)addCenteredSubview:(UIView *)subview;
// moves the current view to the center of it's superview
- (void)moveToCenterOfSuperview;

//===========================================================
//////===========================================================
#pragma mark -alertView弹出提示
- (void)messageBox:(NSString *)msg;

- (UIViewController *)viewController;
#pragma mark - 传如父窗口类型 获取父窗口实例对象
- (UIView *)tx_superview_withSuperClassType:(Class)aClass;

@end
