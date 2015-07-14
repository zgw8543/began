//
//  NewsCell.h
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Match;

@interface NewsCell : UITableViewCell

@property (nonatomic, retain) Match *match;
@property (nonatomic, retain) UIImageView *imageview;
@property (nonatomic, retain) UILabel *titleLabel;

@end
