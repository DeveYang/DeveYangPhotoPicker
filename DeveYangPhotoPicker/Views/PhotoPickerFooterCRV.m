//
//  PhotoPickerFooterCRV.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoPickerFooterCRV.h"
@interface PhotoPickerFooterCRV()
@property (weak, nonatomic) UILabel *footerLabel;
@end
@implementation PhotoPickerFooterCRV

- (UILabel *)footerLabel{
    if (!_footerLabel) {
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.frame = self.bounds;
        footerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:footerLabel];
        self.footerLabel = footerLabel;
    }
    
    return _footerLabel;
}

- (void)setCount:(NSInteger)count{
    _count = count;
    
    if (count > 0) {
        self.footerLabel.text = [NSString stringWithFormat:@"有 %ld 张图片", (NSInteger)count];
    }
}
@end
