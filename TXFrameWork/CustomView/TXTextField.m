//
//  TXTextField.m
//  appDoctor
//
//  Created by senwang on 14/11/2.
//  Copyright (c) 2014年 senwang. All rights reserved.
//

#import "TXTextField.h"
@interface TXTextField()
@property (nonatomic, assign)FirstRespondShow becomeFirstRespondDo;
@property (nonatomic, assign)FirstRespondShow changeTextDo;
@end
@implementation TXTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBorderStyle:UITextBorderStyleLine];
        [self.layer setBorderColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor];
        self.backgroundColor = [UIColor whiteColor];
        [self.layer setBorderWidth:1.0];
        
        _canBlank = NO;
        self.enablesReturnKeyAutomatically = YES;
        
        
        
        [self setClearButtonMode:UITextFieldViewModeWhileEditing];
        
        [self setReturnKeyType:UIReturnKeyDone];
        
        [self addTarget:self action:@selector(keyBoardDismiss) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        [self addTarget:self action:@selector(keyBoardShow) forControlEvents:UIControlEventEditingDidBegin|UIControlEventEditingChanged];
        
        [self addTarget:self action:@selector(editDidEnd) forControlEvents:UIControlEventEditingDidEnd];
        
        [self addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];
        
        
        
    }
    return self;
}

- (void)setcanBlankIsNo_tipStr:(NSString *)tipStr
{
    _canBlank = NO;
    _canBlankIsNo_tipStr = tipStr;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (enabled) {
        self.backgroundColor = [UIColor whiteColor];
    }
    else
    {
//        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
}

- (void)tx_setImage:(UIImage *)image
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.height - 25, self.height)];
    UIImageView *imgView=[[UIImageView alloc] initWithImage:image];
    [leftView addSubview:imgView];
    imgView.center = leftView.center;
    imgView.x = 0;
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)keyBoardDismiss
{
    [self endEditing:YES];
}

- (void)keyBoardShow
{
    if (_becomeFirstRespondDo) {
        [self resignFirstResponder];
        [self endEditing:YES];
        _becomeFirstRespondDo((TXBaseViewController *)self.viewController,self);
        [self resignFirstResponder];
    }
}

-(void)editDidEnd
{
    if (_becomeFirstRespondDo) {
        [self resignFirstResponder];
    }
}
- (void)setBecomeFirstResponDoBlock:(FirstRespondShow)blockDo
{
    _becomeFirstRespondDo = blockDo;
}

- (void)editChange
{
    if (_changeTextDo) {
        _changeTextDo(self.viewController,self);
    }
}
- (void)setTextDidChangeDoBlock:(FirstRespondShow)changeTextDo
{
    _changeTextDo = changeTextDo;
}
@end
