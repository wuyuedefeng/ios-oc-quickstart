//
//  SCTextView.m
//  SCFramework
//
//  Created by wangsen on 13/6/14.
//  Copyright (c) 2014 Richer wangsen. All rights reserved.
//

#import "TXTextView.h"
#import "UIView+TXCategory.h"
#import "NSString+TXCategory.h"
@interface TXTextView ()
{
@private
    UILabel *_placeholderLabel;
}

@end

@implementation TXTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:nil];
}

#pragma mark - Init Method

- (void)initialize_add_notification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];
    
    self.placeholderColor = [UIColor lightGrayColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.layer setBorderColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor];
        self.backgroundColor = [UIColor whiteColor];
        [self.layer setBorderWidth:1.0];
        
//        self.contentInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
//        [self setLeft:6];
        
        self.enablesReturnKeyAutomatically = YES;
        [self setReturnKeyType:UIReturnKeyDone];
        
        
        [self initialize_add_notification];
        self.font = [UIFont systemFontOfSize:16];
        self.canBlank = NO;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if ([self.placeholder tx_isNotNilString]) {
        if (!_placeholderLabel) {
            _placeholderLabel = [[UILabel alloc] initWithFrame:
                                 CGRectMake(6.0, 8.0, self.width - 16.0, self.height)];
            _placeholderLabel.backgroundColor = [UIColor clearColor];
            _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeholderLabel.textColor = self.placeholderColor;
            _placeholderLabel.numberOfLines = 0;
            _placeholderLabel.font = self.font;
            [self addSubview:_placeholderLabel];
        }
        
        _placeholderLabel.text = self.placeholder;
        [_placeholderLabel sizeToFit];
        [self sendSubviewToBack:_placeholderLabel];
        
        if ([self.text tx_isNotNilString]) {
            _placeholderLabel.alpha = 0.0;
        } else {
            _placeholderLabel.alpha = 1.0;
        }
    }
    
    [super drawRect:rect];
}

- (void)setcanBlankIsNo_tipStr:(NSString *)tipStr
{
    _canBlank = NO;
    _canBlankIsNo_tipStr = tipStr;
}
#pragma mark - UIResponder Touch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    if ( _endEditingWhenSlide ) {
        [self resignFirstResponder];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
}

#pragma mark - Public Method

- (void)setPlaceholder:(NSString *)placeholder
{
    if (_placeholder != placeholder) {
        _placeholder = @"";
        _placeholder = [placeholder copy];
        [self setNeedsDisplay];
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (_placeholderColor != placeholderColor) {
        _placeholderColor = nil;
        _placeholderColor = placeholderColor;
        [self setNeedsDisplay];
    }
}

- (void)reset
{
    self.text = @"";
    _placeholderLabel.alpha = 1.0;
}

#pragma mark - Notification Method

- (void)textDidChange:(NSNotification *)notification
{
    @synchronized(self)
    {
        if (self.text.length) {
            if (self.text.length == 1) {
                if ([self.text isEqualToString:@"\n"]) {
                    [self resignFirstResponder];
                    self.text = @"";
                }
            }
            else
            {
                if ([[self.text substringFromIndex:self.text.length - 1] isEqualToString:@"\n"]) {
                    [self resignFirstResponder];
                    self.text = [self.text substringToIndex:self.text.length-1];
                }
            }
        }
        else
        {
            self.text = @"";
        }
        
        if ([self.text tx_isNotNilString]) {
            _placeholderLabel.alpha = 0.0;
        } else {
            _placeholderLabel.alpha = 1.0;
        }
    }
}

@end
