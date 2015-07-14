//
//  IntegralView.m
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "IntegralView.h"

@implementation IntegralView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews
{
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    _nameLabel.text = @"常规赛";
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _nameLabel.backgroundColor = [UIColor colorWithWhite:0.850 alpha:1.000];
    [self addSubview:_nameLabel];
    
    self.team_cnLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 3 - 55, 20, 30, 20)];
    _team_cnLabel.text = @"球队";
    _team_cnLabel.font = [UIFont systemFontOfSize:13];
    _team_cnLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_team_cnLabel];

    
    self.labelArray = @[@"场", @"胜", @"平", @"负", @"进", @"失"];
    for (int i = 0; i < _labelArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth / 3 - 10) + i * 35, 20, 45, 20)];
        label.text = _labelArray[i];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - _scoreLabel.frame.size.width - 30, 20, 30, 20)];
    _scoreLabel.text = @"积分";
    _scoreLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_scoreLabel];
        
  /*
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_team_cnLabel.frame) + 50, 20, 10, 20)];
    _countLabel.text = @"场";
    _countLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_countLabel];
    
    self.winLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_countLabel.frame) + 20, 20, 10, 20)];
    _winLabel.text = @"胜";
    _winLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_winLabel];
    
    self.drawLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_winLabel.frame) + 20, 20, 10, 20)];
    _drawLabel.text = @"平";
    _drawLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_drawLabel];
    
    self.loseLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_drawLabel.frame) + 20, 20, 10, 20)];
    _loseLabel.text = @"负";
    _loseLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_loseLabel];
    
    self.goalAndLosegoalLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_loseLabel.frame) + 20, 20, 30, 20)];
    _goalAndLosegoalLabel.text = @"进/失";
    _goalAndLosegoalLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_goalAndLosegoalLabel];
   
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_goalAndLosegoalLabel.frame) + 20, 20, 20, 20)];
    _scoreLabel.text = @"积分";
    _scoreLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_scoreLabel];
   */
}

@end
