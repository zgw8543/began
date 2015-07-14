//
//  HomeViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewController.h"
#import "MatchTableViewController.h"
#import "DataViewController.h"
#import "MineTableViewController.h"
@interface HomeViewController ()



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // 创建首页控制器
    HomeTableViewController *homeTableVc = [[HomeTableViewController alloc] init];
    [self addChildVc:homeTableVc Title:@"首页" image:@"news_normal" selectedImage:@"news_press"];
    
    // 创建比赛控制器
    MatchTableViewController *matchTableVc = [MatchTableViewController new];
    [self addChildVc:matchTableVc Title:@"比赛" image:@"game_normal-1"  selectedImage:@"game_press"];
    
    // 创建数据控制器
    DataViewController *dataVC = [DataViewController new];
    [self addChildVc:dataVC Title:@"数据" image:@"date_normal" selectedImage:@"date_press"];
    
    // 创建我的控制器
    MineTableViewController *mineTableVc = [MineTableViewController new];
    [self addChildVc:mineTableVc Title:@"我的" image:@"circle_normal"  selectedImage:@"circle_press"];


    // 设置导航与标题栏不透明
    self.navigationController.navigationBar.translucent = NO;
    self.tabBar.translucent = NO;
}

#pragma mark -
- (void)addChildVc:(UIViewController *)childVc Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 3.设置子控制器
    
    childVc.view.backgroundColor = [UIColor whiteColor];
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    
    // 点击图片时 变换图片
    // 这张图片按照原始的样子显示出来，不要自动渲染成其他颜色
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 更改字体颜色 设置文字样式
    
    // (1)默认情况下文字颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVc.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    // (2)点击情况下文字颜色
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    dict2[NSForegroundColorAttributeName] = [UIColor colorWithRed:0 green:170/255.0 blue:45/255.0 alpha:1.000];
    [childVc.tabBarItem setTitleTextAttributes:dict2 forState:UIControlStateSelected];
    
    UINavigationController *Nc = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:Nc];
}


@end
