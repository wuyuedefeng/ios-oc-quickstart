//
//  AppDelegate.m
//  QuickExamApp
//
//  Created by TX-009 on 15-3-3.
//  Copyright (c) 2015年 TX-009. All rights reserved.
//

#import "AppDelegate.h"
#import "CheckUpdate.h"
#import "TXHomeTabbarController.h"
@interface AppDelegate ()

@end
static TXHomeTabbarController *homeTabbarCtrl;
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //版本更新检查
    //[[CheckUpdate shareInstance] checkUpdate];
    //手势拖拽
    [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypePan];
    
    [self transToHomeController];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

{
    
    if (!url) {
        
        return NO;
        
    }
    
    NSLog(@"handleOpenURL: %@", [url absoluteString]);
    
    // 在host等于cn.andpush.com时，说明是注册请求
    
    if ([[url host] isEqualToString:@"cn.andpush.com"]) {
        
        // 请求的url地址： andpush://cn.andpush.com/access/register?code=zOdSpC8ZXv
        
        // 获取注册邀请码 code
        
        NSString *code = [[url query] substringFromIndex:[[url query] rangeOfString:@"code="].location+5];
        
        NSLog(@"code: %@", code);
        
        // 使用本地 ViewController 来注册
        
        return YES;
        
    } else {
        
        return NO;
        
    }
    
}



- (void)transToHomeController
{
    if(!homeTabbarCtrl)
    {
        homeTabbarCtrl = [[TXHomeTabbarController alloc] init];
    }
    self.window.rootViewController = homeTabbarCtrl;

    
    [self.window makeKeyAndVisible];
}
+ (void)cleanTXHomeTabbarController
{
    homeTabbarCtrl = nil;
}
+ (void)hideTableBar:(BOOL)shouldHide
{
    if (homeTabbarCtrl) {
        if (shouldHide) {
            [homeTabbarCtrl hideMyTabBar];
        }
        else
        {
            [homeTabbarCtrl showMyTabBar];
        }
    }
}
@end
