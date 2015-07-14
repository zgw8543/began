//
//  MovieCell.h
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Match;

@interface MovieCell : UITableViewCell

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *imagelinkView;
@property (nonatomic, retain) Match *match;
@property (nonatomic, retain) UILabel *match_timeLabel;
@property (nonatomic, retain) NSString *hrefView;


@end
