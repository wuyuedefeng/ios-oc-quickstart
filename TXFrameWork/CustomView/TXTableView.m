//
//  TXTableView.m
//  appDoctor
//
//  Created by TX－0020 on 14-11-14.
//  Copyright (c) 2014年 TX－0020. All rights reserved.
//

#import "TXTableView.h"
@implementation TXTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        [self setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)isInvalidateTextField_TXEditableTableViewCell
{
    NSArray *cells = self.visibleCells;
    for (UITableViewCell *cell in cells) {
        NSLog(@"%@",NSStringFromClass([cell class]));
        if ([cell isKindOfClass:[TXEditableTableViewCell class]]) {
            TXEditableTableViewCell *editableCell = (TXEditableTableViewCell *)cell;
            if (![editableCell.textField.text tx_isNotNilString]) {
                if (![(TXTextField *)editableCell.textField canBlank]) {
                    [self messageBox:[(TXTextField *)editableCell.textField canBlankIsNo_tipStr]];
                    return NO;
                }
            }
        }
    }
    return YES;
}
@end
