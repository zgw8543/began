//
//  MovieTableViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Match.h"
#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "MovieListViewController.h"


@interface MovieTableViewController ()

@property (nonatomic, retain) NSMutableArray *movieArray;
@property (nonatomic, retain) Match *match;

@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addData];
    
    self.view.frame = CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.height);
    
    
}

- (void)addData
{
    self.movieArray = [NSMutableArray new];
    
//    NSString *str2 = [NSString stringWithFormat:@"http://platform.sina.com.cn/premierleague/videolist?app_key=2586208540&url=http://sports.sina.com.cn/video/c/j/csl/match/2015/18/Guoan_Lvcheng/&if_rotate_video=1&match_id=%d", ]
    NSString *str1 = @"http://platform.sina.com.cn/premierleague/videolist?app_key=2586208540&url=http://sports.sina.com.cn/video/c/j/csl/match/2015/18/Guoan_Lvcheng/&if_rotate_video=1&match_id=120978";
    NSURL *url = [NSURL URLWithString:str1];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    __block typeof(self) weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@", dict);
        
        for (NSDictionary *item in dict[@"result"][@"data"]) {
            Match *m = [Match new];
            [m setValuesForKeysWithDictionary:item];
            [weakSelf.movieArray addObject:m];
        }
//        NSLog(@"%@", weakSelf.movieArray);
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

    return _movieArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"boy"];
    if (!cell) {
        cell = [[MovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"boy"];
    }
    
    Match *m = _movieArray[indexPath.row];
    [cell.imagelinkView sd_setImageWithURL:[NSURL URLWithString:m.imagelink]];
    cell.titleLabel.text = m.title;
    cell.match_timeLabel.text = m.match_time;
//    [cell.hrefView sd_setImageWithURL:[NSURL URLWithString:m.href]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieListViewController *movieListVC = [MovieListViewController new];
    [self.navigationController pushViewController:movieListVC animated:YES];
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
