//
//  ImprotentTableViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "ImprotentTableViewController.h"
#import "Match.h"
#import "ImportantCell.h"
#import "UIImageView+WebCache.h"
#import "ImportantDetilViewController.h"


@interface ImprotentTableViewController ()

@property (nonatomic, retain) Match *match;

@property (nonatomic, retain) NSMutableArray *bigArray;


@end

@implementation ImprotentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addData];

    
}

- (void)addData
{
    self.bigArray = [NSMutableArray new];
    
    NSString *str = @"http://client.mix.sina.com.cn/api/match_extra/get?app_key=2586208540&_sport_t_=livecast&__version__=3.0.2.05&__os__=android&show_extra=1&f=livecast_id,LeagueType,status,Team1Id,Team2Id,Score1,Score2,MatchId,LiveMode,Discipline,data_from,Title,date,time,Team1,Team2,Flag1,Flag2,NewsUrl,VideoUrl,LiveUrl,LiveStatusExtra,VideoLiveUrl,VideoBeginTime,narrator,LeagueType_cn,Discipline_cn,comment_id,odds_id,VideoEndTime,if_rotate_video,LiveStatusExtra_cn,m3u8,android,period_cn,program,penalty1,penalty1,Round_cn,extrarec_ovxVideoId&_sport_a_=filterMatchesByMatchType&type=3,4";
    
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!data) return ;
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@", dict);
        
        for (NSDictionary *item in dict[@"result"][@"data"][@"full"]) {
            NSLog(@"%@", item);
            Match *m = [Match new];
            [m setValuesForKeysWithDictionary:item];
            [_bigArray addObject:m];
        }
        
//        NSLog(@"%@", _bigArray);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _bigArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImportantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil) {
        cell = [[ImportantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    Match *m = _bigArray[indexPath.row];
    cell.Team1Label.text = m.Team1;
    cell.Team2Label.text = m.Team2;
    [cell.flageImage1 sd_setImageWithURL:[NSURL URLWithString:m.Flag1]];
    [cell.flageImage2 sd_setImageWithURL:[NSURL URLWithString:m.Flag2]];
    cell.score1Label.text = m.Score1;
    cell.score2Label.text = m.Score2;
    cell.timeLabel.text = m.time;
    cell.LeagueType_cnLabel.text = m.LeagueType_cn;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImportantDetilViewController *importVC = [ImportantDetilViewController new];
    
    [self.navigationController pushViewController:importVC animated:YES];
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
