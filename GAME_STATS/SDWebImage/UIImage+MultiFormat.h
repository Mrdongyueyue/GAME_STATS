//
//  UIImage+MultiFormat.h
//  SDWebImage
//
//  Created by Olivier Poitrey on 07/06/13.
//  Copyright (c) 2013 Dailymotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MultiFormat)

+ (UIImage *)sd_imageWithData:(NSData *)data;
//图片进行等比压缩
+ (UIImage *)compressImageWith:(UIImage *)image;
@end
