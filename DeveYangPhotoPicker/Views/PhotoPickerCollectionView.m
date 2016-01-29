//
//  PhotoPickerCollectionView.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//  显示相册内容的CollectionView

#import "PhotoPickerCollectionView.h"
#import "PhotoPickerFooterCRV.h"
#import "PhotoPickerCollectionViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoAssets.h"
#import "PhotoPickerImageView.h"
#import "PhotoPickerCommon.h"

@interface PhotoPickerCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
//统计描述一共有多少照片(为collectionView添加尾部视图)
@property (nonatomic , strong) PhotoPickerFooterCRV *footerView;
// 判断是否是第一次加载
@property (nonatomic , assign , getter=isFirstLoadding) BOOL firstLoadding;
@end
@implementation PhotoPickerCollectionView
#pragma mark -getter
- (NSMutableArray *)selectsIndexPath{
//    如果没有照片索引值数组就创建
    if (!_selectsIndexPath) {
        _selectsIndexPath = [NSMutableArray array];
    }
    if (_selectsIndexPath) {
        //以数组的形式获取集合中的所有对象
        NSSet *set = [NSSet setWithArray:_selectsIndexPath];
        _selectsIndexPath = [NSMutableArray arrayWithArray:[set allObjects]];
    }
    return _selectsIndexPath;
}

#pragma mark -setter
//重新设置相册内容数据
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    // 判断是否需要记录选中的值的数据
    if (self.isRecoderSelectPicker){
        NSMutableArray *selectAssets = [NSMutableArray array];
        /**
         *  self.selectAssets是选中的图片数组
         */
        for (PhotoAssets *asset in self.selectAssets) {
            for (PhotoAssets *asset2 in self.dataArray) {
                
                if (![asset isKindOfClass:[PhotoAssets class]] || ![asset2 isKindOfClass:[PhotoAssets class]]) {
                    continue;
                }
//                判断选中图片的url和dataArray的url是否一样...如果一样的话就是被选中的图片
                if ([asset.asset.defaultRepresentation.url isEqual:asset2.asset.defaultRepresentation.url]) {
                    [selectAssets addObject:asset2];
                    break;
                }
            }
        }
        _selectAssets = selectAssets;
    }
    
    [self reloadData];
}
/**
 *  初始化Collection
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        _selectAssets = [NSMutableArray array];
    }
    return self;
}

#pragma mark -<UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoPickerCollectionViewCell *cell = [PhotoPickerCollectionViewCell cellWithCollectionView:collectionView cellForItemAtIndexPath:indexPath];
    if(indexPath.item == 0 && self.topShowPhotoPicker){
        UIImageView *imageView = [[cell.contentView subviews] lastObject];
        // 判断真实类型
        if (![imageView isKindOfClass:[UIImageView class]]) {
            imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.clipsToBounds = YES;
            [cell.contentView addSubview:imageView];
        }
        imageView.tag = indexPath.item;
        imageView.image = [UIImage imageNamed:@"camera"];
    }else{
        PhotoPickerImageView *cellImgView = [[PhotoPickerImageView alloc] initWithFrame:cell.bounds];
        cellImgView.maskViewFlag = YES;
        
        // 需要记录选中的值的数据
        if (self.isRecoderSelectPicker) {
            for (PhotoAssets *asset in self.selectAssets) {
                if ([asset isKindOfClass:[PhotoAssets class]] && [asset.asset.defaultRepresentation.url isEqual:[(PhotoAssets *)self.dataArray[indexPath.item] asset].defaultRepresentation.url]) {
                    [self.selectsIndexPath addObject:@(indexPath.row)];
                }
            }
        }
        
        [cell.contentView addSubview:cellImgView];
        cellImgView.maskViewFlag = ([self.selectsIndexPath containsObject:@(indexPath.row)]);
        PhotoAssets *asset = self.dataArray[indexPath.item];
        cellImgView.isVideoType = asset.isVideoType;
        if ([asset isKindOfClass:[PhotoAssets class]]) {
//            获得系统生成的缩略图
            cellImgView.image = asset.aspectRatioImage;
        }
    }
    
    return cell;
}

- (BOOL)validatePhotoCount:(NSInteger)maxCount{
    if (self.selectAssets.count >= maxCount) {
        NSString *format = [NSString stringWithFormat:@"最多只能选择%zd张图片",maxCount];
        if (maxCount == 0) {
            format = [NSString stringWithFormat:@"您已经选满了图片了."];
        }
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:format delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
        [alertView show];
        return NO;
    }
    return YES;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.topShowPhotoPicker && indexPath.item == 0) {
        NSUInteger maxCount = (self.maxCount < 0) ? KPhotoShowMaxCount :  self.maxCount;
        if (![self validatePhotoCount:maxCount]){
            return ;
        }
        if ([self.collectionViewDelegate respondsToSelector:@selector(pickerCollectionViewDidCameraSelect:)]) {
            [self.collectionViewDelegate pickerCollectionViewDidCameraSelect:self];
        }
        return ;
    }
    
    if (!self.lastDataArray) {
        self.lastDataArray = [NSMutableArray array];
    }
    
    PhotoPickerCollectionViewCell *cell = (PhotoPickerCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    
    PhotoAssets *asset = self.dataArray[indexPath.row];
    PhotoPickerImageView *pickerImageView = [cell.contentView.subviews lastObject];
    // 如果没有就添加到数组里面，存在就移除
    if (pickerImageView.isMaskViewFlag) {
        [self.selectsIndexPath removeObject:@(indexPath.row)];
        [self.selectAssets removeObject:asset];
        [self.lastDataArray removeObject:asset];
    }else{
        // 1 判断图片数超过最大数或者小于0
        NSUInteger maxCount = (self.maxCount < 0) ? KPhotoShowMaxCount :  self.maxCount;
        if (![self validatePhotoCount:maxCount]){
            return ;
        }
        
        [self.selectsIndexPath addObject:@(indexPath.row)];
        [self.selectAssets addObject:asset];
        [self.lastDataArray addObject:asset];
    }
    // 告诉代理现在被点击了!
    if ([self.collectionViewDelegate respondsToSelector:@selector(pickerCollectionViewDidSelected: deleteAsset:)]) {
        if (pickerImageView.isMaskViewFlag) {
            // 删除的情况下
            [self.collectionViewDelegate pickerCollectionViewDidSelected:self deleteAsset:asset];
        }else{
            [self.collectionViewDelegate pickerCollectionViewDidSelected:self deleteAsset:nil];
        }
    }
    
    pickerImageView.maskViewFlag = ([pickerImageView isKindOfClass:[PhotoPickerImageView class]]) && !pickerImageView.isMaskViewFlag;
    
}

#pragma mark 底部View
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PhotoPickerFooterCRV *reusableView = nil;
    if (kind == UICollectionElementKindSectionFooter) {
        PhotoPickerFooterCRV *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerView.count = self.dataArray.count;
        reusableView = footerView;
        self.footerView = footerView;
    }else{
        
    }
    return reusableView;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    // 时间置顶的话
    if (self.status == PickerCollectionViewShowOrderStatusTimeDesc) {
        if (!self.firstLoadding && self.contentSize.height > [[UIScreen mainScreen] bounds].size.height) {
            // 滚动到最底部（最新的）
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataArray.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
            // 展示图片数
            self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y + 100);
            self.firstLoadding = YES;
        }
    }else if (self.status == PickerCollectionViewShowOrderStatusTimeAsc){
        // 滚动到最底部（最新的）
        if (!self.firstLoadding && self.contentSize.height > [[UIScreen mainScreen] bounds].size.height) {
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
            // 展示图片数
            self.contentOffset = CGPointMake(self.contentOffset.x, -self.contentInset.top);
            self.firstLoadding = YES;
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
