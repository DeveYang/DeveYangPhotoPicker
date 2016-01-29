//
//  PhotoPickerCollectionViewCell.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoPickerCollectionViewCell.h"
static NSString *const _cellIdentifier = @"PhotoPickerCollectionViewCell";
@implementation PhotoPickerCollectionViewCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    if ([[cell.contentView.subviews lastObject] isKindOfClass:[UIImageView class]]) {
        [[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    return cell;
}
@end
