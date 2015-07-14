//
//  NewsTableViewController.m
//  ballFans
//
//  Created by lanou3g on 15/7/11.
//  Copyright (c) 2015年 张吴凃. All rights reserved.
//

#import "NewsTableViewController.h"
#import "Match.h"
#import "NewsCell.h"
#import "UIImageView+WebCache.h"
#import "NewsDtailListViewController.h"


@interface NewsTableViewController ()

@property (nonatomic, retain) NSMutableArray *newsArray;



@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addData];
    
    self.view.frame = CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.height);
    
//    self.view.backgroundColor = [UIColor yellowColor];
    

}

- (void)addData
{
    self.newsArray = [NSMutableArray new];
    NSString *str = @"http://platform.sina.com.cn/sports_client/news?app_key=2586208540&match_id=120978&zt=1&news_type=2,3&level=2,3&len=20";
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    __block typeof(self) weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *item in dict[@"result"][@"data"]) {
            Match *match = [Match new];
            [match setValuesForKeysWithDictionary:item];
            [weakSelf.newsArray addObject:match];
        }
        NSLog(@"%@", weakSelf.newsArray);
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

    return _newsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    
    Match *m = _newsArray[indexPath.row];
    [cell.imageview sd_setImageWithURL:[NSURL URLWithString:m.image]];
    cell.titleLabel.text = m.title;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDtailListViewController *newsDetailListVC = [NewsDtailListViewController new];
    [self.navigationController pushViewController:newsDetailListVC animated:YES];
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
