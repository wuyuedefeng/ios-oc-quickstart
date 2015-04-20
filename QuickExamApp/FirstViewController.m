//
//  FirstViewController.m
//  QuickExamApp
//
//  Created by TX-009 on 15-3-10.
//  Copyright (c) 2015年 TX-009. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
- (void)viewDidLoad {
    [AppDelegate hideTableBar:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.keyBoardScrollView addSubview:self.tableView];
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadDataSource];
    }];
    // 马上进入刷新状态
    [self.tableView.legendHeader beginRefreshing];
    
//    [self.tableView addLegendFooterWithRefreshingBlock:^{
//        [weakSelf loadDataSource];
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadDataSource {
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    CGFloat MJDuration = 2.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
