//
//  MovieCell.m
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "MovieCell.h"
#import "Match.h"

@implementation MovieCell

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
    self.imagelinkView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 60)];
    [self.contentView addSubview:_imagelinkView];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, self.frame.size.width - 60, 40)];
    _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.f];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    _match_timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 55, 100, 10)];
    _match_timeLabel.font = [UIFont fontWithName:@"Helvetica" size:11.f];
    [self.contentView addSubview:_match_timeLabel];
//    _hrefView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 20, 20, 20)];
//    [_imagelinkView addSubview:_hrefView];
    
    
}

- (void)setMatch:(Match *)match
{
    if (_match != match) {
        _match = nil;
        _match = [match copy];
        _titleLabel.text = match.title;
        _match_timeLabel.text = match.match_time;
        
        
    }
}

@end
