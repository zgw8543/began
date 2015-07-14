//
//  DataScore.h
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface DataScore : NSObject


@property (nonatomic, assign) NSInteger team_order; // 排名
@property (nonatomic, copy) NSString *logo; // 队标
@property (nonatomic, copy) NSString *team_cn; // 队名
@property (nonatomic, copy) NSString *count; // 总场数
@property (nonatomic, copy) NSString *win; // 胜场数
@property (nonatomic, copy) NSString *draw; // 平
@property (nonatomic, copy) NSString *lose; // 负
@property (nonatomic, copy) NSString *goal; // 进球数
@property (nonatomic, copy) NSString *losegoal; // 失球数
@property (nonatomic, copy) NSString *score; // 积分




@end
