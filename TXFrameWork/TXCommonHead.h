//
//  TXCommonHead.h
//  QuickExamApp
//
//  Created by TX-009 on 15-3-3.
//  Copyright (c) 2015年 TX-009. All rights reserved.
//

#ifndef QuickExamApp_TXCommonHead_h
#define QuickExamApp_TXCommonHead_h

//#import <UIViewController+ScrollingNavbar.h>
#import <MLBlackTransition.h>
#import <BlocksKit.h>
#import <Masonry.h>

#import "NSString+TXCategory.h"
#import "UIViewController+TXCategory.h"
#import "UIView+TXCategory.h"
#import "UIColor+TXCategory.h"
#import "UIView+WhenTappedBlocks.h"
#import "UITableViewCell+TXCategory.h"

#import "TXHomeTabbarController.h"
#import "TXBaseNavigationController.h"
#import "TXBaseViewController.h"

#import "TXKeyboardManager.h"
#import "TXScrollView.h"
#import "TXKeyBoardScrollView.h"
#import "TXTextField.h"
#import "TXTextView.h"
#import "TXTableView.h"
#import "TXTableViewCell.h"
#import "TXEditableTableViewCell.h"
#import "TXButton.h"


#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
// 屏幕尺寸
#define kTXScreenSize   ([UIScreen mainScreen].bounds.size)
#define kTXScreenWidth  (kTXScreenSize.width)
#define kTXScreenHeight (kTXScreenSize.height)
/**
 *定义常用宏
 *NSLog
 *release模式通常会定义 __OPTIMIZE__，当然debug模式不会
 **/

#define kkTXAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

#ifndef __OPTIMIZE__
# define NSLog(...) NSLog(__VA_ARGS__)
# define TXLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
# define NSLog(...) {}
# define TXLog(...) {}
#endif

///// 严格单例
#if __has_feature(objc_arc)
#define kTXStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}
#else
#define kTXStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}\
- (id)retain {\
return self;\
}\
- (NSUInteger)retainCount {\
return NSUIntegerMax;\
}\
- (oneway void)release {\
}\
- (id)autorelease {\
return self;\
}
#endif



#endif
