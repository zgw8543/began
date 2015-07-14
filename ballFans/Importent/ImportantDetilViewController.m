//
//  ImportantDetilViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "ImportantDetilViewController.h"
#import "MovieTableViewController.h"
#import "NewsTableViewController.h"
//#import "DateTableViewController.h"

@interface ImportantDetilViewController () <UIScrollViewDelegate>

@property (nonatomic, strong)UISegmentedControl *segment;


@property (nonatomic, retain) MovieTableViewController *movieVC;
@property (nonatomic, retain) NewsTableViewController *newsVC;
//@property (nonatomic, retain) DateTableViewController *dataVC;



@end

@implementation ImportantDetilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    _movieVC = [MovieTableViewController new];
    [self addChildViewController:_movieVC];
    _newsVC = [NewsTableViewController new];
    [self addChildViewController:_newsVC];
//    _dataVC = [DateTableViewController new];
//    [self addChildViewController:_dataVC];
    [self.view addSubview:_movieVC.view];
    
    UIImage *image = [UIImage imageNamed:@"bonawu"];
    UIImageView *imageViwe = [[UIImageView alloc] initWithImage:image];
    imageViwe.frame = CGRectMake(0, 65, self.view.frame.size.width, 140);
    [self.view addSubview:imageViwe];
    
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"视频", @"新闻", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arr];
    segment.frame = CGRectMake(0, 175, self.view.frame.size.width, 30);
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
            view = _movieVC.view;
            break;
            
        case 1:
            view = _newsVC.view;
            break;
            
//        case 2:
//            view = _dataVC.view;
//            break;
        default:
            break;
    }
    [self.view insertSubview:view atIndex:0];

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
