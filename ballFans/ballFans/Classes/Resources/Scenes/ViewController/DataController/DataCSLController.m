//
//  DataCSLController.m
//  ballFans
//
//  Created by lanou3g on 15/7/10.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "DataCSLController.h"

// 自定义cell 和自定义视图
#import "IntegralView.h"
#import "DataCell.h"

#import "OtherDataCell.h"
#import "OtherDataView.h"
// 模型
#import "DataScore.h"
#import "GoalData.h"

// 图片加载的第三方
#import "UIImageView+WebCache.h"


#define kScoreURL @"http://platform.sina.com.cn/sports_client/team_rank?app_key=2586208540&_version__=3.1.0.10&__os__=android&_sport_t_=football&_sport_s_=opta&_sport_a_=teamOrder&league_type=213&client_deviceid=171f7b48824bc55a6018fe4e3ee28fb8"

#define kGoalURL @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_version__=3.1.0.10&__os__=android&_sport_t_=football&_sport_s_=opta&_sport_a_=playerorder&type=213&item=13&limit=20"

#define kAssistURL @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_version__=3.1.0.10&__os__=android&_sport_t_=football&_sport_s_=opta&_sport_a_=playerorder&type=213&item=2&limit=20"

#define kCardURL @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_version__=3.1.0.10&__os__=android&_sport_t_=football&_sport_s_=opta&_sport_a_=playerorder&type=213&item=11&limit=20"



@interface DataCSLController ()

@property (nonatomic, assign) NSUInteger segmentedIndex;
@property (nonatomic, strong) NSMutableArray *scoreArray;
@property (nonatomic, strong) NSMutableArray *goalArray;
@property (nonatomic, strong) NSMutableArray *assistArray;
@property (nonatomic, strong) NSMutableArray *cardArray;

@property (nonatomic, strong) IntegralView *integralView;
@property (nonatomic, strong) OtherDataView *otherDataView;

@property (nonatomic, strong) NSMutableArray *allDataArray;

@end

@implementation DataCSLController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.integralView = [[IntegralView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    
    self.tableView.tableHeaderView = _integralView;
    [self loadDataWithSegmentedIndex:0];
}

#pragma mark 懒加载
- (NSMutableArray *)allDataArray
{
    if (!_allDataArray) {
        self.allDataArray = [NSMutableArray array];
    }
    
    return _allDataArray;
}

#pragma mark 根据点击的下标，获取相应的页面数据网址 然后加载数据并保存到各自的数组中
- (void)loadDataWithSegmentedIndex:(NSUInteger)index
{
    NSString *urlString = nil;
    switch (index) {
        case 0:
            urlString = kScoreURL;
            break;
        case 1:
            urlString = kGoalURL;
            break;
        case 2:
            urlString = kAssistURL;
            break;
        case 3:
            urlString = kCardURL;
            break;
    }
    
    __block typeof(self) weakSelf = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        if (!data) {
            return;
        }
        
        // 解析数据
       switch (index) {
           case 0: {
               weakSelf.scoreArray = [NSMutableArray array];
               NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
               for (NSDictionary *item in [[dict[@"result"][@"data"] allValues] firstObject]) {
                   DataScore *score = [DataScore new];
                   [score setValuesForKeysWithDictionary:item];
                   [weakSelf.scoreArray addObject:score];
               }
               NSLog(@"%ld", weakSelf.scoreArray.count);
               
            break;
           }
           case 1: {
               weakSelf.goalArray = [NSMutableArray array];
               NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
               for (NSDictionary *item in dict[@"result"][@"data"]) {
                   GoalData *goal = [GoalData new];
                   [goal setValuesForKeysWithDictionary:item];
                   [weakSelf.goalArray addObject:goal];
               }
               break;
           }
           case 2: {
               weakSelf.assistArray = [NSMutableArray array];
               NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
               for (NSDictionary *item in dict[@"result"][@"data"]) {
                   GoalData *goal = [GoalData new];
                   [goal setValuesForKeysWithDictionary:item];
                   [weakSelf.assistArray addObject:goal];
               }
               break;
           }
           case 3: {
               weakSelf.cardArray = [NSMutableArray array];
               NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
               for (NSDictionary *item in dict[@"result"][@"data"]) {
                   GoalData *goal = [GoalData new];
                   [goal setValuesForKeysWithDictionary:item];
                   [weakSelf.cardArray addObject:goal];
               }
               break;
           }
            
        }
        // 更新数据
        [weakSelf.tableView reloadData];
    }];
    
}

#pragma mark segementedControl添加点击事件
- (void)segmentedControl1Action:(UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0: {
            self.integralView = [[IntegralView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
            
            self.tableView.tableHeaderView = _integralView;
            _segmentedIndex = 0;

            if (_scoreArray && _scoreArray.count > 0) {
                
            } else {
                [self loadDataWithSegmentedIndex:_segmentedIndex];
            }
            [self.tableView reloadData];
            NSLog(@"积分榜");
             break;
        }
        case 1: {
            self.otherDataView = [[OtherDataView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
            self.otherDataView.goalLabel.text = @"进球";
            self.tableView.tableHeaderView = _otherDataView;
            
            _segmentedIndex = 1;
            if (_goalArray && _goalArray.count > 0) {
                
            } else {
                [self loadDataWithSegmentedIndex:_segmentedIndex];
            }
            [self.tableView reloadData];
            
            NSLog(@"射手榜");
            
            break;
        }
        case 2: {
            self.otherDataView = [[OtherDataView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
            self.otherDataView.goalLabel.text = @"助攻数";
            self.tableView.tableHeaderView = _otherDataView;
            
            _segmentedIndex = 2;
            if (_assistArray && _assistArray.count > 0) {
                
            } else {
                [self loadDataWithSegmentedIndex:_segmentedIndex];
            }
            [self.tableView reloadData];
            NSLog(@"助攻榜");
            break;
        }
        case 3: {
            self.otherDataView = [[OtherDataView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
            self.otherDataView.goalLabel.text = @"红黄牌";
            self.tableView.tableHeaderView = _otherDataView;
            
            _segmentedIndex = 3;
            if (_cardArray && _cardArray.count > 0) {
                
            } else {
                [self loadDataWithSegmentedIndex:_segmentedIndex];
            }
            [self.tableView reloadData];
            
            NSLog(@"红黄牌");
            
            break;
        }
    }
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_segmentedIndex == 0) {
        return self.scoreArray.count;
        
    } else if (_segmentedIndex == 1) {
        return _goalArray.count;
        
    } else if (_segmentedIndex == 2) {
        return _assistArray.count;
        
    } else {
        return _cardArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_segmentedIndex == 0) {
        DataScore *score = [DataScore new];
        score = self.scoreArray[indexPath.row];
        NSArray *array = @[score.count, score.win, score.draw, score.lose, score.goal, score.losegoal, score.score];
        
        static NSString *reuseIdentifier = @"scoreCell";
        DataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[DataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier array:array];
        }
        // 给cell赋值
        cell.team_order.text = [NSString stringWithFormat:@"%ld", score.team_order];
        [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:score.logo]];
        cell.team_cnLabel.text = score.team_cn;
        
        
        if (indexPath.row < 3) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:22/255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000];
        } else {
            cell.contentView.backgroundColor = [UIColor grayColor];
        }
        for (UIView *labelView in cell.contentView.subviews) {
            if ([labelView isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)labelView;
                label.textColor = [UIColor whiteColor];
            }
        }
        
        return cell;
    } else if (_segmentedIndex == 1) {
        static NSString *reuseIdentifier = @"goalCell";
        OtherDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[OtherDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        GoalData *goal = _goalArray[indexPath.row];
        
        cell.numLabel.text = goal.num;
        cell.playerLabel.text = goal.player_name;
        [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:goal.pic]];
        cell.teamLabel.text = goal.team_name;
        cell.goalLabel.text = goal.item1;
        
        if (indexPath.row < 3) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:22/255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000];
        } else {
            cell.contentView.backgroundColor = [UIColor grayColor];
        }
        for (UIView *labelView in cell.contentView.subviews) {
            if ([labelView isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)labelView;
                label.textColor = [UIColor whiteColor];
            }
        }
        return cell;
    } else if (_segmentedIndex == 2) {
        
        static NSString *reuseIdentifier = @"assistCell";
        OtherDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[OtherDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        GoalData *goal = _assistArray[indexPath.row];
        
        cell.numLabel.text = goal.num;
        cell.playerLabel.text = goal.player_name;
        [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:goal.pic]];
        cell.teamLabel.text = goal.team_name;
        cell.goalLabel.text = goal.item1;
        
        if (indexPath.row < 3) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:22/255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000];
        } else {
            cell.contentView.backgroundColor = [UIColor grayColor];
        }
        for (UIView *labelView in cell.contentView.subviews) {
            if ([labelView isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)labelView;
                label.textColor = [UIColor whiteColor];
            }
        }
        return cell;
    } else {
        static NSString *reuseIdentifier = @"cardCell";
        OtherDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[OtherDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        GoalData *goal = _cardArray[indexPath.row];
        
        cell.numLabel.text = goal.num;
        cell.playerLabel.text = goal.player_name;
        [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:goal.pic]];
        cell.teamLabel.text = goal.team_name;
        cell.goalLabel.text = goal.item1;
        if (indexPath.row < 3) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:22/255.0 green:158 / 255.0 blue:72 / 255.0 alpha:1.000];
        } else {
            cell.contentView.backgroundColor = [UIColor colorWithWhite:0.500 alpha:1.000];
        }
        
        for (UIView *labelView in cell.contentView.subviews) {
            if ([labelView isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)labelView;
                label.textColor = [UIColor whiteColor];
            }
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
