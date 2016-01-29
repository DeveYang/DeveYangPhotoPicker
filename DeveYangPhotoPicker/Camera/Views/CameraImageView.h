//
//  CameraImageView.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/28.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CameraImageView;
@protocol  CameraImageViewDelegate<NSObject>
@optional
/**
 *  根据index来删除照片
 */
- (void) deleteImageView : (CameraImageView *) imageView;
@end
@interface CameraImageView : UIImageView

@property (weak, nonatomic) id <CameraImageViewDelegate> delegatge;
/**
 *  是否是编辑模式 , YES 代表是
 */
@property (assign, nonatomic, getter = isEdit) BOOL edit;


@end
