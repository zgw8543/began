//
//  FootLotter.h
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Match;

@interface FootLotter : UITableViewCell


@property (nonatomic, retain) Match *match;

@property (nonatomic, retain) UIImageView *footballTeamLabel1;
@property (nonatomic, retain) UIImageView *footballTeamLabel2;
@property (nonatomic, retain) UIImageView *footballTeamLabel3;

@end
