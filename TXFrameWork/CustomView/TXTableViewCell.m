//
//  TXTableViewCell.m
//  appDoctor
//
//  Created by senwang on 14/11/9.
//  Copyright (c) 2014年 senwang. All rights reserved.
//

#import "TXTableViewCell.h"
#import "UIView+TXCategory.h"
@implementation TXTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    TXButton *clickBtn = [[TXButton alloc] init];
    clickBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:clickBtn];
    _clickBtn = clickBtn;
    
    
    
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:self.imageView.bounds];
    [headImageView.layer setCornerRadius:5.0];
    [headImageView.layer setMasksToBounds:YES];
    [self.contentView addSubview:headImageView];
    _headImageView = headImageView;
    
    
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.imageView setHeight:self.height*0.8];
    [self.imageView setY:self.height * 0.1];
    [self.imageView setWidth:self.imageView.height];
    [self.imageView setX:15];
    [self.imageView.layer setCornerRadius:5.0];
    [self.imageView.layer setMasksToBounds:YES];
    
    
    
    if (self.layoutSubViewEndDoBlock) {
        self.layoutSubViewEndDoBlock(self);
    }
}
- (void)tx_layoutSubViewsEndDo:(TXVoidBlock_id)block
{
    self.layoutSubViewEndDoBlock = block;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
