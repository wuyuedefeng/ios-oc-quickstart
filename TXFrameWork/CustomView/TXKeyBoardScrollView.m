//
//  TXKeyBoardScrollView.m
//  appDoctor
//
//  Created by TX-009 on 14-10-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXKeyBoardScrollView.h"
#import "TXKeyboardManager.h"
#import "UIView+WhenTappedBlocks.h"
#import "UIViewController+TXCategory.h"
@implementation TXKeyBoardScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self whenTapped:^{
            [self endEditing:YES];
        }];
//        [self setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
    }
    return self;
}
- (void)addSubview_canAjustKeyBoard:(UIView *)view
{
    [self addSubview_canAjustKeyBoard:view padding:0.0];
}
- (void)addSubview_canAjustKeyBoard:(UIView *)view padding:(CGFloat)padding
{
    [self addSubview:view];
    if ([view isKindOfClass:[UITextField class]]) {
        [(UITextField *)view setDelegate:self];
    }
    else if([view isKindOfClass:[UITextView class]])
    {
        [(UITextView *)view setDelegate:self];
    }
    CGFloat height = view.y + view.height + 20 ;
    if (height - self.height > 0 ) {
        self.contentSize = CGSizeMake(self.contentSize.width, height);
    }
}

#pragma mark - textField delegate method
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[TXKeyboardManager sharedTXKeyboardManager] setActiveTextField:textField];
    [[TXKeyboardManager sharedTXKeyboardManager] setCurrentScrollView:self];
    return YES;
}
#pragma mark - textView delegate method
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [[TXKeyboardManager sharedTXKeyboardManager] setActiveTextField:textView];
    [[TXKeyboardManager sharedTXKeyboardManager] setCurrentScrollView:self];
    return YES;
}

#pragma mark - 验证子控件的textField和textView是否合法
- (BOOL)isValidate
{
    for (UIView *subView in self.subviews) {
        [subView resignFirstResponder];
        if ([subView isKindOfClass:[TXTextField class]]) {
            if (![[(TXTextField *)subView text] tx_isNotNilString]) {
                if (![(TXTextField *)subView canBlank]) {
                    [self messageBox:[(TXTextField *)subView canBlankIsNo_tipStr]];
                    return NO;
                }
            }
        }
        else if ([subView isKindOfClass:[TXTextView class]])
        {
            if (![[(TXTextView *)subView text] tx_isNotNilString]) {
                if (![(TXTextView *)subView canBlank]) {
                    [self messageBox:[(TXTextView *)subView canBlankIsNo_tipStr]];
                    return NO;
                }
            }
            
        }
    }
    return YES;
}
@end
