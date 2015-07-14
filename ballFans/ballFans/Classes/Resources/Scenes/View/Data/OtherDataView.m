//
//  OtherDataView.m
//  ballFans
//
//  Created by lanou3g on 15/7/14.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "OtherDataView.h"

@implementation OtherDataView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super  initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.playerLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 50, 20)];
    
    _playerLabel.text = @"球员";
    _playerLabel.font = [UIFont systemFontOfSize:13];
    _playerLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_playerLabel];
    
    self.teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_playerLabel.frame) + 130, 0, 50, 20)];
    _teamLabel.text = @"球队";
    _teamLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_teamLabel];
    
    self.goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_teamLabel.frame) + 20, 0, 50, 20)];
    _goalLabel.font = [UIFont systemFontOfSize:13];
    _goalLabel.textAlignment = NSTextAlignmentCenter;
//    _goalLabel.text = @"进球";
    [self addSubview:_goalLabel];
    
}

@end
