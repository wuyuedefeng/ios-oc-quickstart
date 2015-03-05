//
//  TXTableViewCell.h
//  appDoctor
//
//  Created by senwang on 14/11/9.
//  Copyright (c) 2014年 senwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXButton.h"
@interface TXTableViewCell : UITableViewCell
typedef void (^TXVoidBlock_id)(TXTableViewCell *tableCell);

@property (nonatomic,weak)UIImageView *headImageView;
@property (nonatomic,strong)TXButton *clickBtn;

@property (nonatomic,assign) TXVoidBlock_id layoutSubViewEndDoBlock;
- (void)tx_layoutSubViewsEndDo:(TXVoidBlock_id)block;

@end
