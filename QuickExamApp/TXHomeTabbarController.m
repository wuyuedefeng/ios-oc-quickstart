//
//  YHCustomTabbar.m
//  CustomTabbar
//
//  Created by Jiang on 14-5-28.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import "TXHomeTabbarController.h"

@interface TXHomeTabbarController ()
{
    UIView *_btnContentView;
}
@end

@implementation TXHomeTabbarController

@synthesize currentSelectedIndex;
@synthesize buttons;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        [self.tabBar setHidden:YES];
    }
    return self;
}

- (CGFloat)getScreenHeight
{
    if (IOS7_OR_LATER) {
        return [UIScreen mainScreen].applicationFrame.size.height + 20;
    }
    
    return [UIScreen mainScreen].applicationFrame.size.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureViewControllers];
    
    _images = [[NSMutableArray alloc] initWithCapacity:1];
    [_images addObjectsFromArray:@[@"tabbar_1",@"tabbar_2",@"tabbar_3",@"tabbar_4"]];
    
    _selectedImages = [[NSMutableArray alloc] initWithCapacity:1];
    [_selectedImages addObjectsFromArray:@[@"tabbar_1_highlight",@"tabbar_2_highlight",@"tabbar_3_highlight",@"tabbar_4_highlight"]];
    
    
    [self customTabBar];

}
- (void)configureViewControllers
{
    //初始化ViewController
    TXBaseViewController *patient = [[TXBaseViewController alloc] init];
    patient.title = @"1";
    
    TXBaseViewController *work = [[TXBaseViewController alloc] init];
    work.title = @"2";
    
    TXBaseViewController *consult = [[TXBaseViewController alloc] init];
    consult.title = @"3";
    
    TXBaseViewController *more = [[TXBaseViewController alloc] init];
    more.title = @"4";
    
    //创建导航
    TXBaseNavigationController *nav1 = [[ TXBaseNavigationController alloc] initWithRootViewController:patient];
    [patient setHidesBottomBarWhenPushed:YES];
    TXBaseNavigationController *nav2 = [[TXBaseNavigationController alloc] initWithRootViewController:work];
    [work setHidesBottomBarWhenPushed:YES];
    TXBaseNavigationController *nav3 = [[TXBaseNavigationController alloc] initWithRootViewController:consult];
    [consult setHidesBottomBarWhenPushed:YES];
    TXBaseNavigationController *nav4 = [[TXBaseNavigationController alloc]initWithRootViewController:more];
    [more setHidesBottomBarWhenPushed:YES];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[nav1,nav2,nav3,nav4]];
    
    //初始化Tabbarcontroller
    self.viewControllers = controllers;
    self.selectedIndex = 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    static BOOL shouldExec;
    if (!shouldExec) {
        slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabar_bgview_selected"]];
        [self hideRealTabBar];
        shouldExec = !shouldExec;
    }
}

//隐藏掉系统自带的tabbar
- (void)hideRealTabBar
{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            break;
        }
    }
    [self.tabBar setHidden:YES];
}

- (void)customTabBar
{

    UIView *buttonContentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.tabBar.y, self.tabBar.width, self.tabBar.frame.size.height)];
    _btnContentView = buttonContentView;
    [buttonContentView setBackgroundColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    [self.view addSubview:buttonContentView];
    //创建按钮
    NSInteger viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = 320 / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,0, _width, _height);
        [btn setImage:[UIImage imageNamed:_images[i]] forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[UIImage imageNamed:_selectedImages[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.buttons addObject:btn];
        [buttonContentView  addSubview:btn];
    }
    

    [self selectedTab:[self.buttons objectAtIndex:0]];
    
    [self.buttons[self.selectedIndex] setSelected:YES];
    
}

- (void)selectedTab:(UIButton *)button
{
    if (self.currentSelectedIndex == button.tag) {
      
        [([self.viewControllers objectAtIndex:button.tag]) popToRootViewControllerAnimated:YES];
	
        return;
    }
    
    [self.buttons[self.currentSelectedIndex] setSelected:NO];
    self.currentSelectedIndex = (int)button.tag;
    [self.buttons[self.currentSelectedIndex] setSelected:YES];
    
    self.selectedIndex = self.currentSelectedIndex;
//    [self performSelector:@selector(slideTabBg:) withObject:button];
    
    
}

- (void)slideTabBg:(UIButton *)btn
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationDelegate:self];
    slideBg.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    [UIView commitAnimations];
}
- (void)hideMyTabBar
{
    _btnContentView.hidden = YES;
}
- (void)showMyTabBar
{
    _btnContentView.hidden = NO;
}
@end
