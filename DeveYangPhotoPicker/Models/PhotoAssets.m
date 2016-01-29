//
//  PhotoAssets.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoAssets.h"

@implementation PhotoAssets
- (UIImage *)aspectRatioImage{
    return [UIImage imageWithCGImage:[self.asset aspectRatioThumbnail]];
}

- (UIImage *)thumbImage{
    return [UIImage imageWithCGImage:[self.asset thumbnail]];
}

- (UIImage *)originImage{
    return [UIImage imageWithCGImage:[[self.asset defaultRepresentation] fullScreenImage]];
}

- (BOOL)isVideoType{
    NSString *type = [self.asset valueForProperty:ALAssetPropertyType];
    //媒体类型是视频
    return [type isEqualToString:ALAssetTypeVideo];
}

- (NSURL *)assetURL{
    return [[self.asset defaultRepresentation] url];
}

@end
