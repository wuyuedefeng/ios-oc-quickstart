//
//  TXKeyBoardScrollView.h
//  appDoctor
//
//  Created by TX-009 on 14-10-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXScrollView.h"

@interface TXKeyBoardScrollView : TXScrollView<UITextFieldDelegate,UITextViewDelegate>

- (void)addSubview_canAjustKeyBoard:(UIView *)view;
//- (void)addSubview_canAjustKeyBoard:(UIView *)view padding:(CGFloat)padding;

- (BOOL)isValidate;

@end
