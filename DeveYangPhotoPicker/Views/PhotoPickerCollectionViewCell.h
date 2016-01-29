//
//  PhotoPickerCollectionViewCell.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoPickerCollectionViewCell : UICollectionViewCell
+ (instancetype) cellWithCollectionView : (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *) indexPath;

@property (nonatomic , strong) UIImage *cellImage;
@end
