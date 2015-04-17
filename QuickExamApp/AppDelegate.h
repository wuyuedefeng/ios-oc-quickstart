//
//  AppDelegate.h
//  QuickExamApp
//
//  Created by TX-009 on 15-3-3.
//  Copyright (c) 2015年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//new
- (void)transToHomeController;
+ (void)hideTableBar:(BOOL)shouldHide;
+ (UIView *)tabBarCustomView;

@end

