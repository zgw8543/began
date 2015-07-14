//
//  MatchViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "MatchViewController.h"
#import "ImprotentTableViewController.h"
#import "CareTableViewController.h"
#import "FootLotteryTableViewController.h"


@interface MatchViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *labelScrollView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"重要", @"关注", @"赛事"];
    
    // 添加页面滚动视图
    [self addScrollView];
    
    // 添加标题栏滚动视图
    [self addlabelScrollView];

    
}

#pragma mark 添加页面滚动视图
- (void)addScrollView
{
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height - 104 - 49)];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _array.count, _scrollView.frame.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor cyanColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}


#pragma mark 添加标题栏滚动视图
- (void)addlabelScrollView
{
    self.labelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    _labelScrollView.contentSize = CGSizeMake(self.view.frame.size.width / 3 * _array.count, 40);
    
    for (int i = 0; i < _array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i * self.view.frame.size.width / 3, 0, self.view.frame.size.width / 3, _labelScrollView.frame.size.height);
        [button setTitle:[_array objectAtIndex:i] forState:UIControlStateNormal];
        button.tag = 1 + i;
        [_labelScrollView addSubview:button];
        
        // 设置button按钮的点击事件
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        // 添加控制器
        [self addControllerView:button.tag];
    }
    
    [self.view addSubview:_labelScrollView];
}

- (void)addControllerView:(NSInteger)tag
{
    switch (tag) {
        case 1:{
            static ImprotentTableViewController *importentVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
               importentVC = [[ImprotentTableViewController alloc] initWithStyle:UITableViewStylePlain];
                //   CSLVC.view.backgroundColor = [UIColor redColor];
                [self setController:importentVC tag:tag];
            });
            break;
        }
        case 2:{
            static CareTableViewController *careVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                careVC = [[CareTableViewController alloc] initWithStyle:UITableViewStylePlain];
                //  premierLeagueVC.view.backgroundColor = [UIColor cyanColor];
                [self setController:careVC tag:tag];
            });
            break;
        }
        case 3:{
            static FootLotteryTableViewController *footLotteryVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                footLotteryVC = [[FootLotteryTableViewController alloc] initWithStyle:UITableViewStylePlain];
                [self setController:footLotteryVC tag:tag];
            });
            break;
        }
        
    }
}

#pragma mark 设置添加控制的相关属性
- (void)setController:(UITableViewController *)controller tag:(NSInteger)tag
{
    
    CGFloat r = arc4random() % 255 / 255.;
    CGFloat g = arc4random() % 255 / 255.;
    CGFloat b = arc4random() % 255 / 255.;
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    
    controller.view.backgroundColor = color;
    [self addChildViewController:controller];
    
    controller.view.frame = CGRectMake(self.view.frame.size.width * (tag - 1), _scrollView.frame.origin.y - 104, self.view.frame.size.width, _scrollView.frame.size.height);
    [self.scrollView addSubview:controller.view];
    
}

#pragma mark 标题栏上Button的触发方法
- (void)buttonAction:(UIButton *)sender
{
    
    
    
    
}

#pragma mark 设置滚动视图滚动时执行的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 设置滚动视图水平方向滚动
    if (scrollView.contentOffset.y != 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }
    
    
}

#pragma mark 设置滚动视图滚动减速时的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获取滚动视图的滚动后的偏移量
    CGFloat scrollViewOffSet = scrollView.contentOffset.x;
    // 将偏移量转化为翻页数
    int scrollViewPageNum = scrollViewOffSet / scrollView.frame.size.width;
    
    // 根据scrollView的偏移量改变labelscrollView的偏移量
    //  _labelScrollView.contentOffset = CGPointMake(kScreenWidth / 5 * scrollViewPageNum, 0);
    
    [_labelScrollView scrollRectToVisible:CGRectMake(self.view.frame.size.width / 5 * scrollViewPageNum, 0, _labelScrollView.frame.size.width, _labelScrollView.frame.size.height) animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
