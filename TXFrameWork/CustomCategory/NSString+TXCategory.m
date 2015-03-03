//
//  NSString+TXCategory.m
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "NSString+TXCategory.h"
#import <objc/runtime.h>
@implementation NSNull (TXCategory)
-(BOOL) tx_isNotNilString
{
    return NO;
}
- (CGSize)tx_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    return CGSizeZero;
}
- (NSUInteger)length
{
    return 0;
}
- (BOOL)isEqualToString:(NSString *)aString
{
    return false;
}
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
{
    return @"";
}
- (id)jsonObject_tx
{
    return nil;
}
- (int)intValue
{
    return 0;
}
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet
{
    return NSMakeRange(0,0);
}
- (NSString *)stringByAppendingString:(NSString *)aString
{
    return aString;
}
-(NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    return @"";
}
@end
/***
 *  ///////////////添加ContainsString分类 该方法在ios8才被系统提供 该方法为了向下兼容
 */
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000
@implementation NSString (TXContainsString)
+ (void)load {
    @autoreleasepool {
        [self pspdf_modernizeSelector:NSSelectorFromString(@"containsString:") withSelector:@selector(containsString:)];
    }
}
+ (void)pspdf_modernizeSelector:(SEL)originalSelector withSelector:(SEL)newSelector {
    if (![NSString instancesRespondToSelector:originalSelector]) {
        Method newMethod = class_getInstanceMethod(self, newSelector);
        class_addMethod(self, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    }
}
// containsString: has been added in iOS 8. We dynamically add this if we run on iOS 7.
- (BOOL)containsString:(NSString *)aString {
    return [self rangeOfString:aString].location != NSNotFound;
}
@end
#endif
/**
 *  /////////////////////
 */
@implementation NSString (TXCategory)
- (NSString *)jsonString_tx
{
    return @"";
}
#pragma mark - 判断字符串是否不为空(' ',nil,null)
/**
 *  判断字符串是否不为空 包括(' ',nil,null)
 *
 *  @return 如果不是(' ',nil,null)返回YES
 */
-(BOOL) tx_isNotNilString
{
    if(self != nil && ![self isEqual:[NSNull null]] && self.length != 0 && ![[self lowercaseString] isEqualToString:@"(null)"])
    {
        return YES;
    }
    return NO;
}
/**
 *  @brief URL
 */
- (NSURL *)tx_URL
{
    return [NSURL URLWithString:self];
}
/**
 *  @brief URL编码
 */
- (NSString *)tx_URLEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease
    (CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                             (CFStringRef)self,
                                             NULL,
                                             CFSTR("!*'();:@&=+$,/?%#[]"),
                                             kCFStringEncodingUTF8));
    return result;
}
#pragma mark - MD5加密
/**
 *  MD5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *) tx_md5_encrypt
{
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return [outputString copy];
}
#pragma mark - 字符串转换成JSON数据
/**
 *  将json字符串 解析成 id 类型
 *
 *  @return 返回解析后的数据
 */
- (id)jsonObject_tx
{
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    if (error || [NSJSONSerialization isValidJSONObject:result] == NO)
        return nil;
    return result;
}
#pragma mark - 获取字符串尺寸
/**
 *  计算文字尺寸
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 *  maxSize 限制计算文字的最大宽度和高度 如果宽度设置100 高度设置为MAXFLOAT 则返回文字宽度最大100 高度无限制的所输入文字的尺寸
 */
- (CGSize)tx_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    if (![self tx_isNotNilString]) {
        return CGSizeMake(0, 0);
    }
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}
- (CGSize)tx_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize addSize:(CGSize)addSize
{
    CGSize tmpSize = [self tx_sizeWithFont:font maxSize:maxSize];
    return CGSizeMake(tmpSize.width + addSize.width, tmpSize.height + addSize.height);
}

+ (NSString *)transSelectDaysWithString:(NSString *)selectedDayStr
{
    selectedDayStr = [selectedDayStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"第天给药 "]];
    NSMutableArray *arrM = [NSMutableArray array];
    while ([selectedDayStr tx_isNotNilString]) {
        if ([selectedDayStr rangeOfString:@","].length > 0) {
            NSString *tmpStr = [selectedDayStr substringToIndex:[selectedDayStr rangeOfString:@","].location];
            [arrM addObject:tmpStr];
            selectedDayStr = [selectedDayStr substringFromIndex:[selectedDayStr rangeOfString:@","].location+1];
        }
        else
        {
            [arrM addObject:selectedDayStr];
            break;
        }
    }
    if (arrM.count == 0) {
        return @"";
    }
    NSArray *arr = [arrM sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    
    
    
    
    
    NSString *tmpStr = @"";
    for (int i = 0; i< arr.count; i++) {
        int currentNum = [arr[i] intValue];
        
        if (i < (int)arr.count - 2) {
            int nextNum = [arr[i + 1] intValue];
            int nextNextNum = [arr[i + 2] intValue];
            if (currentNum + 1 == nextNum && nextNum+1 == nextNextNum) {
                int endNum = [NSString nextIndexOfIndex:i+2 :arr];
                tmpStr = [NSString stringWithFormat:@"%@%d-%d,",tmpStr,currentNum,[arr[endNum] intValue]];
                i = endNum;
                continue;
            }
            else
            {
                tmpStr = [NSString stringWithFormat:@"%@%d,",tmpStr,currentNum];
            }
        }
        else
        {
            tmpStr = [NSString stringWithFormat:@"%@%d,",tmpStr,currentNum];
        }
    }
    tmpStr = [tmpStr substringToIndex:tmpStr.length -1];
    tmpStr = [NSString stringWithFormat:@"第%@天给药",tmpStr];
    return tmpStr;
}
+ (int)nextIndexOfIndex:(int)index :(NSArray *)arr
{
    int currentNum = [arr[index] intValue];
    if (index < arr.count-1) {
        int nextNum = [arr[index+1] intValue];
        if (currentNum + 1 == nextNum) {
            index = [self nextIndexOfIndex:index + 1 :arr];
        }
    }
    return index;
}


//stringByReplacingOccurrencesOfString:withString:options:range:


@end
