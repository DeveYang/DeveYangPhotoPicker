//
//  CameraViewController.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/28.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CameraCallBack)(id object);

@interface CameraViewController : UIViewController
// 顶部View
@property (weak, nonatomic) UIView *topView;
// 底部View
@property (weak, nonatomic) UIView *controlView;
// 拍照的个数限制
@property (assign,nonatomic) NSInteger maxCount;
// 完成后回调
@property (copy, nonatomic) CameraCallBack callback;

- (void)showPickerVc:(UIViewController *)vc;
@end
