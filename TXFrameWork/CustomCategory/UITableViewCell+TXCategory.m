//
//  UITableViewCell+TXCategory.m
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITableViewCell+TXCategory.h"
#import "UIView+TXCategory.h"
@implementation UITableViewCell (TXCategory)
@dynamic tx_tableView;
@dynamic tx_indexPath;
/**
 *  获取该cell所属的tableView
 *
 *  @return tableView对象
 */
- (UITableView *)tx_tableView
{
    return (UITableView *)[self tx_superview_withSuperClassType:[UITableView class]];
}
/**
 *  cell 所在tableView的IndexPath
 *
 *  @return 返回indexpath
 */
- (NSIndexPath *)tx_indexPath
{
	return [self.tx_tableView indexPathForCell:self];
}
@end
