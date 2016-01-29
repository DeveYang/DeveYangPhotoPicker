//
//  PhotoPickerImageView.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoPickerImageView.h"
@interface PhotoPickerImageView()
@property (nonatomic , weak) UIView *maskView;
@property (nonatomic , weak) UIButton *tickImageView;
@property (nonatomic , weak) UIImageView *videoView;
@end
@implementation PhotoPickerImageView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

- (UIView *)maskView{
    if (!_maskView) {
        UIView *maskView = [[UIView alloc] init];
        maskView.frame = self.bounds;
        maskView.backgroundColor = [UIColor whiteColor];
        maskView.alpha = 0.5;
        [self addSubview:maskView];
        self.maskView = maskView;
    }
    return _maskView;
}

- (UIImageView *)videoView{
    if (!_videoView) {
        UIImageView *videoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.bounds.size.height - 40, 30, 30)];
        videoView.image = [UIImage imageNamed:@"video"];
        videoView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:videoView];
        self.videoView = videoView;
    }
    return _videoView;
}

- (UIButton *)tickImageView{
    if (!_tickImageView) {
        UIButton *tickImageView = [[UIButton alloc] init];
        tickImageView.frame = CGRectMake(self.bounds.size.width - 28, 5, 21, 21);
        //        [tickImageView addTarget:self action:@selector(clickTick) forControlEvents:UIControlEventTouchUpInside];
        [tickImageView setImage:[UIImage imageNamed:@"icon_image_no"] forState:UIControlStateNormal];
        [self addSubview:tickImageView];
        self.tickImageView = tickImageView;
    }
    return _tickImageView;
}

- (void)setIsVideoType:(BOOL)isVideoType{
    _isVideoType = isVideoType;
    
    self.videoView.hidden = !(isVideoType);
}

- (void)setMaskViewFlag:(BOOL)maskViewFlag{
    _maskViewFlag = maskViewFlag;
    
    //    self.maskView.hidden = !maskViewFlag;
    self.animationRightTick = maskViewFlag;
}

- (void)setMaskViewColor:(UIColor *)maskViewColor{
    _maskViewColor = maskViewColor;
    
    self.maskView.backgroundColor = maskViewColor;
}

- (void)setMaskViewAlpha:(CGFloat)maskViewAlpha{
    _maskViewAlpha = maskViewAlpha;
    
    self.maskView.alpha = maskViewAlpha;
}

- (void)setAnimationRightTick:(BOOL)animationRightTick{
    _animationRightTick = animationRightTick;
    
    if (animationRightTick) {
        [self.tickImageView setImage:[UIImage imageNamed:@"icon_image_yes"] forState:UIControlStateNormal];
    }else{
        [self.tickImageView setImage:[UIImage imageNamed:@"icon_image_no"] forState:UIControlStateNormal];
    }
    
    CAKeyframeAnimation *scaoleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaoleAnimation.duration = 0.25;
    scaoleAnimation.autoreverses = YES;
    scaoleAnimation.values = @[[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.2],[NSNumber numberWithFloat:1.0]];
    scaoleAnimation.fillMode = kCAFillModeForwards;
    
    if (self.isVideoType) {
        [self.videoView.layer removeAllAnimations];
        [self.videoView.layer addAnimation:scaoleAnimation forKey:@"transform.rotate"];
    }else{
        [self.tickImageView.layer removeAllAnimations];
        [self.tickImageView.layer addAnimation:scaoleAnimation forKey:@"transform.rotate"];
    }
}

@end
