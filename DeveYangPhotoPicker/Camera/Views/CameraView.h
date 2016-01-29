//
//  CameraView.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/28.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraView;
@protocol CameraViewDelegate <NSObject>
@optional
- (void) cameraDidSelected : (CameraView *) camera;
@end
@interface CameraView : UIView
@property (weak, nonatomic) id <CameraViewDelegate> delegate;
@end
