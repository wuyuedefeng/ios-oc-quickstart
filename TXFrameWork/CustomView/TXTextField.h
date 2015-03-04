//
//  TXTextField.h
//  appDoctor
//
//  Created by senwang on 14/11/2.
//  Copyright (c) 2014年 senwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXBaseViewController.h"
@interface TXTextField : UITextField
typedef void (^FirstRespondShow)(UIViewController *baseController, TXTextField *textField);

//是否允许为空
@property (nonatomic, assign) BOOL canBlank;
//当canBlank 为NO时的提示语
@property (nonatomic, copy) NSString *canBlankIsNo_tipStr;

- (void)tx_setImage:(UIImage *)image;

- (void)setBecomeFirstResponDoBlock:(FirstRespondShow)blockDo;
- (void)setTextDidChangeDoBlock:(FirstRespondShow)changeTextDo;

@end
