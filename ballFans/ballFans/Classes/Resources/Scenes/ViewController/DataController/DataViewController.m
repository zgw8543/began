//
//  DataViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/10.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "DataViewController.h"
#import "DataCSLController.h"
#import "DataPremierLeagueController.h"
#import "DataBundesligaController.h"
#import "DataLaLigaController.h"
#import "DataSerieAController.h"
#import "DataUEFAChampionsLeagueController.h"
#import "DataAFCChampionsLeagueController.h"
#import "DataUEFACupController.h"
#import "DataFIFAWorldCupController.h"



@interface DataViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *labelScrollView;
@property (nonatomic, strong) UIScrollView *siderscrollView;
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) UIView *dataview;
@end

@implementation DataViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.array = @[@"中超", @"英超", @"德甲", @"西甲", @"意甲", @"欧冠", @"亚冠", @"欧预赛", @"亚预赛"];
   
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
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, kScreenWidth, kScreenHeight - 104 - 49)];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _array.count, _scrollView.frame.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor cyanColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    _scrollView.bounces = YES;
    
    [self.view addSubview:_scrollView];
}

#pragma mark

#pragma mark 添加标题栏滚动视图
- (void)addlabelScrollView
{
    self.labelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    _labelScrollView.contentSize = CGSizeMake(kScreenWidth / 5 * _array.count, 40);
    
    for (int i = 0; i < _array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i * kScreenWidth / 5, 0, kScreenWidth / 5, _labelScrollView.frame.size.height);
        [button setTitle:[_array objectAtIndex:i] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        
        button.tag = 1 + i;
        if (button.tag == 1) {
            [button setTitleColor:[UIColor colorWithRed:22 / 255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        [_labelScrollView addSubview:button];
        
        // 设置button按钮的点击事件
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        // 添加控制器
        [self addControllerView:button.tag];
    }

    // 设置标题栏button下面的下划线
    self.siderscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 36, kScreenWidth / 5 - 20, 2)];
    _siderscrollView.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000];
    // 将它的可移动范围 与滑动栏设置成一样
    _siderscrollView.contentSize = _labelScrollView.contentSize;
    // 将它加载到滑动栏视图上
    [_labelScrollView addSubview:_siderscrollView];

    [self.view addSubview:_labelScrollView];
}

#pragma mark 标题栏上Button的触发方法
- (void)buttonAction:(UIButton *)sender
{
    // 根据点击button的tag值 控制scrollView的偏移量
    [_scrollView scrollRectToVisible:CGRectMake(kScreenWidth * (sender.tag - 1), 0, kScreenWidth, _scrollView.frame.size.height) animated:YES];
    
    
    // 根据点击button的tag值，控制labelScrollView的偏移量
    if (sender.tag != 2) {
        
        [_labelScrollView scrollRectToVisible:CGRectMake(kScreenWidth / 5 * (sender.tag - 3), 0, kScreenWidth, _labelScrollView.frame.size.height) animated:YES];
    } else {
         [_labelScrollView scrollRectToVisible:CGRectMake(kScreenWidth / 5 * (sender.tag - 2), 0, kScreenWidth, _labelScrollView.frame.size.height) animated:YES];
    }
}

#pragma mark 添加tableViewController控制器 和segmentController

- (void)addControllerView:(NSInteger)tag
{
    switch (tag) {
        case 1:{
            static DataCSLController *CSLVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                // 添加 tableViewController
                CSLVC = [[DataCSLController alloc] initWithStyle:UITableViewStylePlain];
                // 添加 UISegmentedControl 的背景视图view
                UIView *dataView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
                dataView1.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView1];
                // 添加 UISegmentedControl
                UISegmentedControl *segmentedControl1 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl1.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl1.tintColor = [UIColor blackColor];
                segmentedControl1.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                segmentedControl1.selectedSegmentIndex = 0;
                [segmentedControl1 addTarget:CSLVC action:@selector(segmentedControl1Action:) forControlEvents:UIControlEventValueChanged];
                [dataView1 addSubview:segmentedControl1];
                [self setController:CSLVC tag:tag];
            });
            break;
        }
        case 2:{
            static DataPremierLeagueController *premierLeagueVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                premierLeagueVC = [[DataPremierLeagueController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView2 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView2.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                UISegmentedControl *segmentedControl2 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl2.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl2.tintColor = [UIColor blackColor];
                segmentedControl2.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView2 addSubview:segmentedControl2];
                [self.scrollView addSubview:dataView2];
                [self setController:premierLeagueVC tag:tag];
            });
            break;
        }
        case 3:{
            static DataBundesligaController *bundesligaVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                bundesligaVC = [[DataBundesligaController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView3 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView3.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView3];

                UISegmentedControl *segmentedControl3 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl3.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl3.tintColor = [UIColor blackColor];
                segmentedControl3.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView3 addSubview:segmentedControl3];
                [self setController:bundesligaVC tag:tag];
            });
            break;
        }
        case 4:{
            static DataLaLigaController *laLigaVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                laLigaVC = [[DataLaLigaController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView4 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView4.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView4];

                UISegmentedControl *segmentedControl4 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl4.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl4.tintColor = [UIColor blackColor];
                segmentedControl4.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView4 addSubview:segmentedControl4];
                [self setController:laLigaVC tag:tag];
            });
            break;
        }
        case 5:{
            static DataSerieAController *serieAVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                serieAVC = [[DataSerieAController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView5 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView5.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView5];
                UISegmentedControl *segmentedControl5 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl5.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl5.tintColor = [UIColor blackColor];
                segmentedControl5.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView5 addSubview:segmentedControl5];

                [self setController:serieAVC tag:tag];
            });
            break;
        }
        case 6:{
            static DataUEFAChampionsLeagueController *UEFAChampionsLeagueVc;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                UEFAChampionsLeagueVc  = [[DataUEFAChampionsLeagueController alloc] initWithStyle:
                                          UITableViewStylePlain];
                UIView *dataView6 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView6.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView6];
                UISegmentedControl *segmentedControl6 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl6.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl6.tintColor = [UIColor blackColor];
                segmentedControl6.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView6 addSubview:segmentedControl6];

                [self setController:UEFAChampionsLeagueVc tag:tag];
            });
            break;
        }
        case 7:{
            static DataAFCChampionsLeagueController *AFCChampionsLeagueVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                AFCChampionsLeagueVC = [[DataAFCChampionsLeagueController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView7 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView7.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView7];
                UISegmentedControl *segmentedControl7 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl7.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl7.tintColor = [UIColor blackColor];
                segmentedControl7.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView7 addSubview:segmentedControl7];

                [self setController:AFCChampionsLeagueVC tag:tag];
            });
            break;
        }
        case 8:{
            static DataUEFACupController *UEFACupVC;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                UEFACupVC  = [[DataUEFACupController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView8 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView8.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView8];
                UISegmentedControl *segmentedControl8 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl8.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl8.tintColor = [UIColor blackColor];
                segmentedControl8.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView8 addSubview:segmentedControl8];

                [self setController:UEFACupVC tag:tag];
            });
            break;
        }
        case 9:{
            static DataFIFAWorldCupController *FIFAWorldCupVc;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                FIFAWorldCupVc = [[DataFIFAWorldCupController alloc] initWithStyle:UITableViewStylePlain];
                UIView *dataView9 = [[UIView alloc] initWithFrame:CGRectMake((tag - 1) * kScreenWidth, 0, kScreenWidth, 30)];
                dataView9.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                [self.scrollView addSubview:dataView9];
                UISegmentedControl *segmentedControl9 = [[UISegmentedControl alloc] initWithItems:@[@"积分", @"射手", @"助攻", @"红黄牌"]];
                segmentedControl9.frame = CGRectMake(20, 5, kScreenWidth - 40, 20);
                segmentedControl9.tintColor = [UIColor blackColor];
                segmentedControl9.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
                
                [dataView9 addSubview:segmentedControl9];

                [self setController:FIFAWorldCupVc tag:tag];
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
    
    controller.view.frame = CGRectMake(kScreenWidth * (tag - 1), _scrollView.frame.origin.y - 74, kScreenWidth, kScreenHeight - 183);
    [self.scrollView addSubview:controller.view];
    
}


#pragma mark 设置滚动视图滚动时执行的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    
    CGRect frame = _siderscrollView.frame;
    // 对指示器的x 值进行重新赋值
    frame.origin.x = scrollView.contentOffset.x / 5 + 10;
        _siderscrollView.frame = frame;
  
    // 设置滚动视图水平方向滚动
    if (scrollView.contentOffset.y != 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }
    // 获取滚动视图的滚动后的偏移量
    CGFloat scrollViewOffSet = scrollView.contentOffset.x;
    // 将偏移量转化为翻页数
    int scrollViewPageNum = scrollViewOffSet / scrollView.frame.size.width;
  

    // 根据tag值获取button
    int scrollTag = scrollViewPageNum + 1;
    

    // 获取 偏移量 相对于 一个button的宽度 所占的
//    int t = scrollViewPageNum * kScreenWidth / 5 - kScreenWidth / 5 * (scrollTag - 1);
//    CGFloat precent = t / (kScreenWidth / 5);

     UIButton *button = (UIButton *)[_labelScrollView viewWithTag:scrollTag];
     button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
     [button setTitleColor:[UIColor colorWithRed:22/255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000] forState:UIControlStateNormal];

//    CGFloat fontSize = [self fontSize:(1 - precent) minFont:13 maxFont:18];
//    button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];

    // 基于该button的后面一个button  字体的改变方式
    UIButton *button2 = (UIButton *)[_labelScrollView viewWithTag:(scrollTag + 1)];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    CGFloat fontSize2 = [self fontSize:precent minFont:13 maxFont:18];
//    button2.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize2];
  
    // 基于该button的前面一个button  字体的改变方式
   if (scrollTag != 1) {
    UIButton *button3 = (UIButton *)[_labelScrollView viewWithTag:(scrollTag - 1)];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        CGFloat fontSize3 = [self fontSize:precent minFont:13 maxFont:18];
//        button3.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize3];
    }
}
#pragma mark 设置button是上文字随着滚动的变化而改变大小的方法
- (CGFloat)fontSize:(CGFloat)precent minFont:(CGFloat)minFont maxFont:(CGFloat)maxFont
{
    CGFloat result = minFont;
    CGFloat change = precent * (maxFont - minFont);
    result = minFont + change;
    return result;
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
    if (scrollViewPageNum != 1) {
         [_labelScrollView scrollRectToVisible:CGRectMake(kScreenWidth / 5 * (scrollViewPageNum - 2), 0, _labelScrollView.frame.size.width, _labelScrollView.frame.size.height) animated:YES];
    }
}


@end
