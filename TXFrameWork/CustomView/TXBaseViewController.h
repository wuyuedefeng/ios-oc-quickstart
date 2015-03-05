//
//  TXBaseViewController.h
//  appDoctor
//
//  Created by TX-009 on 14-10-28.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TXKeyBoardScrollView;

@interface TXBaseViewController : XHPullRefreshTableViewController
@property (nonatomic, weak) TXKeyBoardScrollView *keyBoardScrollView;


- (void)beginRequestWithAnimation:(BOOL)hasAnimation;

- (void)successRequestWithAnimation:(BOOL)hasAnimation;
- (void)failedRequestWithAnimation:(BOOL)hasAnimation showFailedMessage:(NSString *)str;
- (void)errorRequestWithAnimation:(BOOL)hasAnimation;



#pragma mark -设置导航栏右侧按钮
- (void)setRightBarButtonWithtarget:(id)target action:(SEL)action title:(NSString *)title;

@end
