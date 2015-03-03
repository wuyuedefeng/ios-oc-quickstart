//
//  UIView+TXCategory.m
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIView+TXCategory.h"

@interface UIView ()<UIScrollViewDelegate>

@end
@implementation UIView (TXCategory)
#pragma mark - 设置x y width height 。。。
/**
 *  设置视图的 x
 *
 *  @param x 新的frame的 x 的值
 */
- (void) setX:(CGFloat)x
{
    self.frame = rectSetX(self.frame, x);
}
/**
 *  设置视图的 y
 *
 *  @param y 新的frame的 y 的值
 */
- (void) setY:(CGFloat)y
{
    self.frame = rectSetY(self.frame, y);
}
/**
 *  设置视图的 width
 *
 *  @param width 新的frame的 width 的值
 */
- (void) setWidth:(CGFloat)width
{
    self.frame = rectSetWidth(self.frame, width);
}
/**
 *  设置视图的 height
 *
 *  @param height 新的frame的 height 的值
 */
- (void) setHeight:(CGFloat)height
{
    self.frame = rectSetHeight(self.frame, height);
}
/**
 *  设置视图的 origin
 *
 *  @param origin 新的frame的 origin 的值
 */
- (void) setOrigin:(CGPoint)origin
{
    self.frame = rectSetOrigin(self.frame, origin);
}
/**
 *  设置视图的 size
 *
 *  @param size 新的frame的 size 的值
 */
- (void) setSize:(CGSize)size
{
    self.frame = rectSetSize(self.frame, size);
}
//私有 x
CGRect rectSetX(CGRect rect, CGFloat x) {
	return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}
//y
CGRect rectSetY(CGRect rect, CGFloat y) {
	return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}
//width
CGRect rectSetWidth(CGRect rect, CGFloat width) {
	return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}
//height
CGRect rectSetHeight(CGRect rect, CGFloat height) {
	return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}
//origin
CGRect rectSetOrigin(CGRect rect, CGPoint origin) {
	return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}
//size
CGRect rectSetSize(CGRect rect, CGSize size) {
	return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

/////////////

/////////////
/**
 *  获得 frame的 x 的值
 *
 *  @return 获得 frame的 x 的值
 */
- (CGFloat) x
{
    return self.frame.origin.x;
}
/**
 *  获得 frame的 y 的值
 *
 *  @return 获得 frame的 y 的值
 */
- (CGFloat) y
{
    return self.frame.origin.y;
}
/**
 *  获得 frame的 width 的值
 *
 *  @return 获得 frame的 width 的值
 */
- (CGFloat) width
{
    return self.frame.size.width;
}
/**
 *  获得 frame的 height 的值
 *
 *  @return 获得 frame的 height 的值
 */
- (CGFloat) height
{
    return self.frame.size.height;
}
/**
 *  获得 frame的 origin 的值
 *
 *  @return 获得 frame的 origin 的值
 */
- (CGPoint) origin
{
    return self.frame.origin;
}
/**
 *  获得 frame的 size 的值
 *
 *  @return 获得 frame的 size 的值
 */
- (CGSize)  size
{
    return self.frame.size;
}

//===========================================================
//===========================================================
#pragma mark -
#pragma mark Position Views
//===========================================================
//===========================================================
#pragma mark -
#pragma mark Properties for retreiving/changing of Frame Coordinates
//===========================================================

- (void)setFrameWidth:(CGFloat)width {
	[self setWidth:width];
}

- (void)setFrameHeight:(CGFloat)height {
	[self setHeight:height];
}

- (void)setFrameTop:(CGFloat)top {
	[self setY:top];
}

- (void)setFrameLeft:(CGFloat)left {
	[self setX:left];
}

- (void)setFrameBottom:(CGFloat)bottom {
    //	self.frame = CGRectMake(self.frame.origin.x,bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [self setY:bottom - self.height];
}

- (void)setFrameRight:(CGFloat)right {
    //	self.frame = CGRectMake(right - self.frame.size.width,self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    [self setX:right - self.width];
}

- (CGFloat)frameHeight {
	return self.frame.size.height;
}

- (CGFloat)frameWidth {
	return self.frame.size.width;
}

- (CGFloat)frameTop {
	return self.frame.origin.y;
}

- (CGFloat)frameLeft {
	return self.frame.origin.x;
}

- (CGFloat)frameBottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)frameRight {
	return self.frame.origin.x + self.frame.size.width;
}
//=ws=//
- (void)positionUnderView_boundsEqual:(UIView *)view padding:(CGFloat)padding
{
    self.bounds = view.bounds;
    [self positionUnderView:view padding:padding];
}
- (void)positionUnderView_WidthEqual:(UIView *)view height:(CGFloat)height padding:(CGFloat)padding
{
    [self positionUnderView_boundsEqual:view padding:padding];
    [self setHeight:height];
}
- (void)positionUnderView:(UIView *)view {
	[self positionUnderView:view padding:0];
}

- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding {
	[self positionUnderView:view padding:padding alignment:TXUIViewAlignmentLeftAligned];
}

- (void)positionUnderView:(UIView *)view alignment:(TXUIViewAlignment)alignment {
	[self positionUnderView:view padding:0 alignment:alignment];
}

- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(TXUIViewAlignment)alignment {
	self.frameTop = view.frameBottom + padding;
    
	switch (alignment) {
		case TXUIViewAlignmentUnchanged:
			// do nothing
			break;
		case TXUIViewAlignmentLeftAligned:
			self.frameLeft = view.frameLeft;
			break;
            
		case TXUIViewAlignmentRightAligned:
			self.frameRight = view.frameRight;
			break;
            
		case TXUIViewAlignmentCenter:
			self.center = CGPointMake(view.center.x, self.center.y);
			break;
	}
}

- (void)addCenteredSubview:(UIView *)subview {
	subview.frameLeft = (CGFloat)((self.bounds.size.width - subview.frameWidth) / 2);
	subview.frameTop = (CGFloat)((self.bounds.size.height - subview.frameHeight) / 2);
    
	[self addSubview:subview];
}

- (void)moveToCenterOfSuperview {
	self.frameLeft = (CGFloat)((self.superview.bounds.size.width - self.frameWidth) / 2);
	self.frameTop = (CGFloat)((self.superview.bounds.size.height - self.frameHeight) / 2);
}

//alertView弹出提示
- (void)messageBox:(NSString *)msg
{
    if (![msg tx_isNotNilString]) {
        msg = @"您有必填项没有填写";
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    });
}
////////==========================================================
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
#pragma mark - 传如父窗口类型 获取父窗口实例对象
/////////////

/**
 *  获取父类（包括超父类）对象
 *
 *  @param aClass 父类类型
 *
 *  @return 父类对象 找不到返回nil
 */
- (UIView *)tx_superview_withSuperClassType:(Class)aClass
{
	if (self.superview) {
		if ([self.superview isKindOfClass:aClass]) {
			return self.superview;
		} else {
			return [self.superview tx_superview_withSuperClassType:aClass];
		}
	} else {
		return nil;
	}
}

@end
