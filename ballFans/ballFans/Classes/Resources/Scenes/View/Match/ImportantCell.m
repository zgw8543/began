//
//  ImportantCell.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "ImportantCell.h"
#import "Match.h"

@implementation ImportantCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllView];
    }
    return self;
}

- (void)addAllView
{
    self.Team1Label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 100, 20)];
//    _Team1Label.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_Team1Label];
    
    self.Team2Label = [[UILabel alloc] initWithFrame:CGRectMake(250, 80, 100, 20)];
//    _Team2Label.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_Team2Label];
    
    self.flageImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 80, 60)];
    [self.contentView addSubview:_flageImage1];
    
    self.flageImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(240, 20, 80, 60)];
    [self.contentView addSubview:_flageImage2];
    
    self.score1Label = [[UILabel alloc] initWithFrame:CGRectMake(150, 45, 15, 20)];
    _score1Label.font = [UIFont fontWithName:@"Helvetica" size:22.f];
//    _score1Label.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_score1Label];
    self.score2Label = [[UILabel alloc] initWithFrame:CGRectMake(200, 45, 15, 20)];
    _score2Label.font = [UIFont fontWithName:@"Helvetica" size:22.f];

    [self.contentView addSubview:_score2Label];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 5, 60, 20)];
    _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
//    _timeLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_timeLabel];
    self.LeagueType_cnLabel = [[UILabel alloc] init];
    if ([_LeagueType_cnLabel.text length] <= 3) {
        
        self.LeagueType_cnLabel.frame = CGRectMake(190, 5, 90, 20);
    } else {
        self.LeagueType_cnLabel.frame = CGRectMake(140, 20, 90, 20);
    }
    _LeagueType_cnLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_LeagueType_cnLabel];
    
    
    
}

- (void)setMatch:(Match *)match
{
    if (_match != match) {
        _match = nil;
        _match = [match copy];
        
        _Team1Label.text = match.Team1;
        _Team2Label.text = match.Team2;
        _score1Label.text = match.Score1;
        _score2Label.text = match.Score2;
        _timeLabel.text = match.time;
        _LeagueType_cnLabel.text = match.LeagueType_cn;
    }
}
@end
