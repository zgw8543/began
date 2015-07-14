//
//  Match.h
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Match : NSObject

@property (nonatomic, copy) NSString *team_A_name;
@property (nonatomic, copy) NSString *team_B_name;
@property (nonatomic, copy) NSString *fs_A;
@property (nonatomic, copy) NSString *fs_B;
@property (nonatomic, copy) NSString *competition_name;
@property (nonatomic, copy) NSString *start_play;
@property (nonatomic, copy) NSString *time_utc;


@property (nonatomic, strong) UIImage *footballTeam1;
@property (nonatomic, strong) UIImage *footballTeam2;
@property (nonatomic, strong) UIImage *footballTeam3;

@property (nonatomic, copy) NSString *Team1;
@property (nonatomic, copy) NSString *Team2;
@property (nonatomic, copy) NSString *Flag1;
@property (nonatomic, copy) NSString *Flag2;
@property (nonatomic, copy) NSString *Score1;
@property (nonatomic, copy) NSString *Score2;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *LeagueType_cn;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imagelink;
@property (nonatomic, copy) NSString *match_time;
@property (nonatomic, copy) NSString *href;
@property (nonatomic, copy) NSString *image;


@end
