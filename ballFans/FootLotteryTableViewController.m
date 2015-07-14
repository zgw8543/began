//
//  FootLotteryTableViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "FootLotteryTableViewController.h"
#import "Match.h"
#import "FootLotter.h"
#import "FootDetailViewController.h"



@interface FootLotteryTableViewController ()

@property (nonatomic, retain) NSArray *bigArr;

@property (nonatomic, retain) NSMutableArray *keyArray;

@end

@implementation FootLotteryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllView];

}

- (void)addAllView
{
    
    self.view.frame = CGRectMake(5, 67, 40, self.view.frame.size.height);
    _bigArr = @[@"中超", @"亚洲杯", @"亚冠", @"西甲", @"意甲", @"德甲", @"英超", @"欧冠"];
    NSString *str1 = @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_sport_t_=livecast&__version__=3.0.2.05&__os__=android&show_extra=1&f=livecast_id,LeagueType,status,Team1Id,Team2Id,Score1,Score2,MatchId,LiveMode,Discipline,data_from,Title,date,time,Team1,Team2,Flag1,Flag2,NewsUrl,VideoUrl,LiveUrl,LiveStatusExtra,VideoLiveUrl,VideoBeginTime,narrator,LeagueType_cn,Discipline_cn,comment_id,odds_id,VideoEndTime,if_rotate_video,LiveStatusExtra_cn,m3u8,android,period_cn,program,penalty1,penalty1,Round_cn,extrarec_ovxVideoId&_sport_a_=typeMatches&l_type=328";
    NSString *str2 = @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_sport_t_=livecast&__version__=3.0.2.05&__os__=android&show_extra=1&f=livecast_id,LeagueType,status,Team1Id,Team2Id,Score1,Score2,MatchId,LiveMode,Discipline,data_from,Title,date,time,Team1,Team2,Flag1,Flag2,NewsUrl,VideoUrl,LiveUrl,LiveStatusExtra,VideoLiveUrl,VideoBeginTime,narrator,LeagueType_cn,Discipline_cn,comment_id,odds_id,VideoEndTime,if_rotate_video,LiveStatusExtra_cn,m3u8,android,period_cn,program,penalty1,penalty1,Round_cn,extrarec_ovxVideoId&_sport_a_=typeMatches&l_type=318";
    
    NSString *str3 = @"http://platform.sina.com.cn/sports_all/client_api?app_key=2586208540&_sport_t_=livecast&__version__=3.0.2.05&__os__=android&show_extra=1&f=livecast_id,LeagueType,status,Team1Id,Team2Id,Score1,Score2,MatchId,LiveMode,Discipline,data_from,Title,date,time,Team1,Team2,Flag1,Flag2,NewsUrl,VideoUrl,LiveUrl,LiveStatusExtra,VideoLiveUrl,VideoBeginTime,narrator,LeagueType_cn,Discipline_cn,comment_id,odds_id,VideoEndTime,if_rotate_video,LiveStatusExtra_cn,m3u8,android,period_cn,program,penalty1,penalty1,Round_cn,extrarec_ovxVideoId&_sport_a_=typeMatches&l_type=328";
    
    self.keyArray = [NSMutableArray arrayWithObjects:str1, str2, str3, nil];
    
    
    
}

- (void)editonButtonAction:(UIBarButtonItem *)sender
{
    
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
 
    return _bigArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"footCell"];
    if (!cell) {
        cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"footCell"];
    }

    cell.textLabel.text = [self.bigArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15.f];
    UIImage *football = [UIImage imageNamed:[NSString stringWithFormat:@"%@", cell.textLabel.text]];
    cell.imageView.image = football;
    cell.imageView.layer.cornerRadius = 100;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    FootDetailViewController *footDteilVC = [[FootDetailViewController alloc] init];
    [self.navigationController pushViewController:footDteilVC animated:YES];
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
