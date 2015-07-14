//
//  DataCSLController.h
//  ballFans
//
//  Created by lanou3g on 15/7/10.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^dataBlock)(id obj);
@interface DataCSLController : UITableViewController


@property (nonatomic, strong) dataBlock dataBlock;

- (void)segmentedControl1Action:(UISegmentedControl *)sender;


@end
