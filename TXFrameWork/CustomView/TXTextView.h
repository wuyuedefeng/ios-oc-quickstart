//
//  SCTextView.h
//  SCFramework
//
//  Created by wangsen on 13/6/14.
//  Copyright (c) 2014 Richer wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXTextView : UITextView

//是否允许为空
@property (nonatomic, assign) BOOL canBlank;
//当canBlank 为NO时的提示语
@property (nonatomic, copy) NSString *canBlankIsNo_tipStr;

@property (nonatomic, assign) BOOL endEditingWhenSlide;

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

- (void)reset;



@end
