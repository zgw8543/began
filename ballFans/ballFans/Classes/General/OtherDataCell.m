//
//  OtherDataCell.m
//  ballFans
//
//  Created by lanou3g on 15/7/14.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "OtherDataCell.h"

@implementation OtherDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 30)];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    _numLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:_numLabel];
    
    self.playerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_numLabel.frame) + 20, 10, 100, 30)];
    _playerLabel.textAlignment = NSTextAlignmentCenter;
    _playerLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:_playerLabel];
    
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_playerLabel.frame), 15, 20, 20)];
    [self.contentView addSubview:_logoImageView];
    
    self.teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) + 40, 10, 100, 30)];
    _teamLabel.textAlignment = NSTextAlignmentCenter;
    _teamLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:_teamLabel];
    
    
    self.goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_teamLabel.frame) + 10, 10, 50, 30)];
    _goalLabel.textAlignment = NSTextAlignmentCenter;
    _goalLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:_goalLabel];
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
