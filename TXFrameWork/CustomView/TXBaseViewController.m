//
//  TXBaseViewController.m
//  appDoctor
//
//  Created by TX-009 on 14-10-28.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXBaseViewController.h"
#import "UIColor+TXCategory.h"
#import "UIViewController+TXCategory.h"
#import <MBProgressHUD.h>
#import "UIView+TXCategory.h"
#import "AppDelegate.h"
static MBProgressHUD *HUD;
@interface TXBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation TXBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self showNavBarAnimated:NO];
}
- (void)loadDataSource {

}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self tx_SetTitleText:self.title Color:[UIColor blueColor] font:[UIFont systemFontOfSize:17]];
    
    
    // Do any additional setup after loading the view.
    TXKeyBoardScrollView *keyBoardScrollView = [[TXKeyBoardScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:keyBoardScrollView];
    self.keyBoardScrollView = keyBoardScrollView;
    self.keyBoardScrollView.backgroundColor=[UIColor clearColor];
    self.view.backgroundColor = [UIColor tx_colorWithHexString:@"#efeff4"];
    [self.keyBoardScrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    
    {
//        UIView *superview = self.view;
//        
//        UIView *view1 = [[UIView alloc] init];
//        view1.translatesAutoresizingMaskIntoConstraints = NO;
//        view1.backgroundColor = [UIColor greenColor];
//        [superview addSubview:view1];
//        
//        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
//        
//        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(superview).with.insets(padding);
//        }];
    
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//        btn.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:btn];
//        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView *view = [[UIView alloc] init];
        [self.view addSubview:view];
//        btn.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [UIColor blueColor];
        
        __weak UIView *superview = self.view;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@100);
            make.height.equalTo(@100);
            make.bottom.equalTo(superview.mas_bottom);
        }];
        
        
    }
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        CGRect tableViewFrame = self.view.bounds;
        _tableView = [[TXTableView alloc] initWithFrame:tableViewFrame style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark - TableView Helper Method
- (void)clickBtn{
    FirstViewController *viewController = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)beginRequestWithAnimation:(BOOL)hasAnimation
{
    if (hasAnimation) {
        [self showHUD];
    }
}
- (void)successRequestWithAnimation:(BOOL)hasAnimation
{
    if (hasAnimation) {
        [self removeHUD];
    }
}
- (void)failedRequestWithAnimation:(BOOL)hasAnimation showFailedMessage:(NSString *)str;
{
    if (hasAnimation) {
        [self removeHUD];
    }
}
- (void)errorRequestWithAnimation:(BOOL)hasAnimation
{
    [self removeHUD];
}
- (void)showHUD
{
    if (!HUD) {
        //初始化进度框，置于当前的View当中
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        //如果设置此属性则当前的view置于后台
        //HUD.dimBackground = YES;
        [HUD setMode:MBProgressHUDModeIndeterminate];
        [HUD show:YES];
    }
}
- (void)removeHUD
{
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark -设置导航栏左侧按钮

- (void)popBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -设置导航栏右侧按钮
- (void)setRightBarButtonWithtarget:(id)target action:(SEL)action title:(NSString *)title
{
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action]];
}
#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // in subClass
    return nil;
}
@end
