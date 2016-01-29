//
//  Camera.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/28.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "Camera.h"

@implementation Camera
- (UIImage *)photoImage{
    return [UIImage imageWithContentsOfFile:self.imagePath];
}
@end
