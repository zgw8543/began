//
//  ImportantCell.h
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Match;
@interface ImportantCell : UITableViewCell

@property (nonatomic, retain) UILabel *team_A_nameLabel;
@property (nonatomic, retain) UILabel *team_B_nameLabel;
@property (nonatomic, retain) UILabel *fs_A;
@property (nonatomic, retain) UILabel *fs_B;
@property (nonatomic, retain) UILabel *competition_name;


@property (nonatomic, retain) Match *match;
@property (nonatomic, retain) UILabel *Team1Label;
@property (nonatomic, retain) UILabel *Team2Label;
@property (nonatomic, retain) UIImageView *flageImage1;
@property (nonatomic, retain) UIImageView *flageImage2;
@property (nonatomic, retain) UILabel *score1Label;
@property (nonatomic, retain) UILabel *score2Label;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *LeagueType_cnLabel;


@end
