//
//  DataCell.h
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataScore;

@interface DataCell : UITableViewCell

#pragma mark 自定义cell声明属性
@property (nonatomic, strong) UILabel *team_order; // 排名
@property (nonatomic, strong) UIImageView *logoImageView; // 队标
@property (nonatomic, retain) UILabel *team_cnLabel; // 队名
@property (nonatomic, retain) UILabel *countLabel; // 总场数
@property (nonatomic, retain) UILabel *winLabel;  // 胜的场数
@property (nonatomic, retain) UILabel *drawLabel; // 平
@property (nonatomic, retain) UILabel *loseLabel; // 负
@property (nonatomic, copy) UILabel *goalLabel; // 进球数
@property (nonatomic, copy) UILabel *losegoalLabel; // 失球数
@property (nonatomic, retain) UILabel *scoreLabel;  // 积分

@property (nonatomic, retain) UILabel *label;

@property (nonatomic , retain)DataScore *dataScore;

@property (nonatomic, copy) void(^dataBlock)(DataScore *);
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier array:(NSArray *)array;

//@property (nonatomic, strong) NSMutableArray *tagArray;



@end
