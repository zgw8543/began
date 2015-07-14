//
//  FootDetailViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/14.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "FootDetailViewController.h"
#import "ComptionTableViewController.h"
#import "FootMovieTableViewController.h"
#import "FootNewsTableViewController.h"



@interface FootDetailViewController ()

@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, retain) ComptionTableViewController *comptionVC;
@property (nonatomic, retain) FootMovieTableViewController *footMovieVc;
@property (nonatomic, retain) FootNewsTableViewController *footNewsVC;


@end

@implementation FootDetailViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.view.backgroundColor = [UIColor greenColor];
    _comptionVC = [ComptionTableViewController new];
    [self addChildViewController:_comptionVC];
    _footMovieVc = [FootMovieTableViewController new];
    [self addChildViewController:_footMovieVc];
    _footNewsVC = [FootNewsTableViewController new];
    [self addChildViewController:_footNewsVC];
    [self.view addSubview:_comptionVC.view];

    NSArray *arr = [[NSArray alloc] initWithObjects:@"比赛", @"视频", @"新闻", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arr];
    segment.frame = CGRectMake(0, 67, self.view.frame.size.width, 30);
    segment.tintColor = [UIColor greenColor];
    
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];

}

- (void)segmentAction:(UISegmentedControl *)sender
{
    [self.view.subviews.firstObject removeFromSuperview];
    UIView *view = nil;
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            view = _comptionVC.view;
            break;
            
        case 1:
            view = _footMovieVc.view;
            break;
            
        case 2:
            view = _footNewsVC.view;
            break;
        default:
            break;
    }
    [self.view insertSubview:view atIndex:0];
    
}


@end
