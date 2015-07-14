//
//  NewsCell.m
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "NewsCell.h"
#import "Match.h"

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllData];
    }
    return self;
}

- (void)addAllData
{
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 60)];
    [self.contentView addSubview:_imageview];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, self.frame.size.width - 80, 40)];
//    _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.f];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    
    
}
- (void)setMatch:(Match *)match
{
    if (_match != match) {
        _match = nil;
        _match = [match copy];
        _titleLabel.text = _match.title;
    }
}

@end
