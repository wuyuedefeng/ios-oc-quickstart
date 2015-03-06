////
////  CheckUpdate.m
////  NUAA 
////
////  Created by wangsen on 12-9-19.
////  Copyright (c) 2013年 wangsen. All rights reserved.
////

#import "CheckUpdate.h"
#import "AFHTTPRequestOperationManager.h"
////此APP id为程序申请时得到。更改相应的id查询App的信息
////#define kAPPID      @"907331580"
#define kAppTipUpdate @"appTipUpdate"
@implementation CheckUpdate
+ (CheckUpdate *)shareInstance
{
    static CheckUpdate *update = nil;
    if (!update)
    {
        update = [[CheckUpdate alloc] init];
    }

    return update;
}
- (int)transVersionToInt:(NSString *)version
{
    NSArray *versionArr = [version componentsSeparatedByString:@"."];
    NSLog(@"%@",versionArr.description);
    if (versionArr.count == 2) {
        return [versionArr[0] intValue]*1000000 + [versionArr[1] intValue]*10000;
    }
    else if(versionArr.count == 3)
    {
        return [versionArr[0] intValue]*1000000 + [versionArr[1] intValue]*10000 + [versionArr[2] intValue];
    }
    else if(versionArr.count == 1)
    {
        return [versionArr[0] intValue]*1000000;
    }
    return 0;
}
- (void)checkUpdate
{
    static int index = 0;
    if (!index) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *storeVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kAppTipUpdate];
        if (![storeVersion tx_isNotNilString]) {
            [[NSUserDefaults standardUserDefaults] setObject:version forKey:kAppTipUpdate];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
//        else if([storeVersion isEqualToString:version]) {
//            return ;
//        }
    }
    index++;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",kAPPID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *app=[responseObject objectForKey:@"results"];
        NSDictionary *dic=[app lastObject];
        NSString *appStoreVersion=[dic objectForKey:@"version"];
        NSLog(@"appStoreVersion:%@",appStoreVersion);
        NSLog(@"%@",dic.description);
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:kAppTipUpdate];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        int localVersion_int = [self transVersionToInt:version];
        int appStoreVersion_int = [self transVersionToInt:appStoreVersion];
        
        
        

        if (localVersion_int < appStoreVersion_int) {
            NSLog(@"升级");
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"检测到新版本" message:[dic objectForKey:@"releaseNotes"] delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"更新", nil];
            [alert show];
        }
        else
        {
            if(index != 1)
            {
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"已经是最新版本" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",kAPPID]]];
    }

}

@end
