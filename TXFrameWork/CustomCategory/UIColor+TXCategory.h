//
//  UIColor+TXCategory.h
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TXCategory)
#pragma mark - hexString eg. #ff0000
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *
 *  @return color类型的数据
 */
+ (UIColor *)tx_colorWithHexString:(NSString *)hexString;
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *  @param alpha     透明度
 *
 *  @return color类型的数据
 */
+ (UIColor *)tx_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
