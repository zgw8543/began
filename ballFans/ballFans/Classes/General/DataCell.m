//
//  DataCell.m
//  ballFans
//
//  Created by lanou3g on 15/7/13.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "DataCell.h"

#import "DataScore.h"
#import "UIImageView+WebCache.h"
@implementation DataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier array:(NSArray *)array
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self addAllViews:array];
    }
    return self;
}


#pragma mark 添加控件
- (void)addAllViews:(NSArray *)array
{
    self.team_order = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 20, 20)];
    _team_order.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_team_order];
    
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25 , 15, 20, 20)];
    [self.contentView addSubview:_logoImageView];
    
   
    self.team_cnLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth / 3 - 75, 15, 70, 20)];
    _team_cnLabel.font = [UIFont systemFontOfSize:13];
    _team_cnLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_team_cnLabel];
    


    for (int i = 0; i < 7; i++) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth / 3) + i * 35, 15, 35, 20)];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = array[i];
        
        [self.contentView addSubview:_label];
        
    }
   
}









- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
