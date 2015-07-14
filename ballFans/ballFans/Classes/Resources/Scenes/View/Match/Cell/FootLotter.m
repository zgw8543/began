//
//  FootLotter.m
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "FootLotter.h"

#import "Match.h"


@implementation FootLotter

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addData];
    }
    return self;
}

- (void)addData
{
    _footballTeamLabel1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 100, 100)];
    [self.contentView addSubview:_footballTeamLabel1];
    _footballTeamLabel2 = [[UIImageView alloc] initWithFrame:CGRectMake(115, 10, 100, 100)];
    [self.contentView addSubview:_footballTeamLabel2];
    _footballTeamLabel3 = [[UIImageView alloc] initWithFrame:CGRectMake(225, 10, 100, 100)];
    [self.contentView addSubview:_footballTeamLabel3];
    
}

- (void)setMatch:(Match *)match
{
    if (_match != match) {
        _match = nil;
        _match = [match copy];
        
    }
}


@end
