//
//  Camera.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/28.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Camera : NSObject
@property (copy,nonatomic) NSString *imagePath;
@property (strong,nonatomic) UIImage *thumbImage;
@property (strong,nonatomic) UIImage *photoImage;
@end
