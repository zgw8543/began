//
//  imageDownloader.h
//  Lesson_UI_17_KVO
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

// 引入UIKit框架
#import <UIKit/UIKit.h>

@protocol imageDownloaderDelegate <NSObject>

// 声明一个协议
- (void)imageDownloaderDidFinish:(UIImage *)image;

@end

// 使用 typedef 给 block 起别名
typedef void(^DownloadResult)(UIImage *image);


@interface imageDownloader : NSObject

#pragma mark - 声明下载图片的方法
+ (void)imageDownloaderWithURLStr:(NSString *)url
                         delegate:(id <imageDownloaderDelegate>)delegate;

#pragma mark - 声明下载图片的方法，使用block作为参数
+ (void)imageDownloaderWithURLStr:(NSString *)url
                           result:(DownloadResult)result;


@end
