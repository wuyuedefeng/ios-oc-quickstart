//
//  TXButton.m
//  appDoctor
//
//  Created by TX-009 on 14-11-3.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXButton.h"
@implementation TXButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor tx_colorWithHexString:@"#1B7ACF"] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.titleLabelFrame = CGRectZero;
        self.imageViewFrame = CGRectZero;
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.titleLabelFrame.origin.x == 0 && self.titleLabelFrame.origin.y == 0 && self.titleLabelFrame.size.width == 0 && self.titleLabelFrame.size.height == 0 ) {
        return contentRect;
    }
    else
    {
        return self.titleLabelFrame;
    }
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.imageViewFrame.origin.x == 0 && self.imageViewFrame.origin.y == 0 && self.imageViewFrame.size.width == 0 && self.imageViewFrame.size.height == 0 ) {
        return contentRect;
    }
    else
    {
        return self.imageViewFrame;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
