//
//  imageDownloader.m
//  Lesson_UI_17_KVO
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "imageDownloader.h"

@implementation imageDownloader

#pragma mark - 实现下载图片的方法
+ (void)imageDownloaderWithURLStr:(NSString *)url
                         delegate:(id <imageDownloaderDelegate>)delegate
{
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 将data转为UIImage数据
        UIImage *image = [UIImage imageWithData:data];
        
        // 判断代理是否响应这个协议方法
        if ([delegate respondsToSelector:@selector(imageDownloaderDidFinish:)]) {
            // 让代理去执行这个协议方法
            [delegate imageDownloaderDidFinish:image];
        }
    }];
    
}

#pragma mark - 实现下载图片的方法，使用block作为参数
+ (void)imageDownloaderWithURLStr:(NSString *)url
                           result:(DownloadResult)result
{
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 将data转为UIImage数据
        UIImage *image = [UIImage imageWithData:data];
        
        // 调用block(image)作为它的参数
        result(image);
    }];

}



@end
