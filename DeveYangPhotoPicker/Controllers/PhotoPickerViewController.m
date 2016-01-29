//
//  PhotoPickerViewController.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "PhotoPickerGroupViewController.h"
#import "MyNavigationController.h"

@interface PhotoPickerViewController ()
@property(nonatomic, weak)PhotoPickerGroupViewController  *groupVC;
@end

static NSString *PICKER_TAKE_DONE = @"PICKER_TAKE_DONE";
static NSString *PICKER_TAKE_PHOTO = @"PICKER_TAKE_PHOTO";

@implementation PhotoPickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addNotification];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - init Action
- (void) createNavigationController{
    PhotoPickerGroupViewController *groupVC = [[PhotoPickerGroupViewController alloc] init];
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:groupVC];
    nav.view.frame = self.view.bounds;
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
    self.groupVC = groupVC;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self createNavigationController];
    }
    return self;
}

- (void)setSelectPickers:(NSArray *)selectPickers{
    _selectPickers = selectPickers;
    self.groupVC.selectAsstes = selectPickers;
}

- (void)setStatus:(PickerViewShowStatus)status{
    _status = status;
    self.groupVC.status = status;
}

- (void)setMaxCount:(NSInteger)maxCount{
    if (maxCount <= 0) return;
    _maxCount = maxCount;
    self.groupVC.maxCount = maxCount;
}

- (void)setTopShowPhotoPicker:(BOOL)topShowPhotoPicker{
    _topShowPhotoPicker = topShowPhotoPicker;
    self.groupVC.topShowPhotoPicker = topShowPhotoPicker;
}

#pragma mark - 展示控制器
- (void)showPickerVc:(UIViewController *)vc{
    __weak typeof(vc)weakVc = vc;
    if (weakVc != nil) {
        [weakVc presentViewController:self animated:YES completion:nil];
    }
}

- (void) addNotification{
    // 监听异步done通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(done:) name:PICKER_TAKE_DONE object:nil];
    });
    
    // 监听异步点击第一个Cell的拍照通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectCamera:) name:PICKER_TAKE_PHOTO object:nil];
    });
}

#pragma mark - 监听点击第一个Cell进行拍照
- (void)selectCamera:(NSNotification *)noti{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([self.delegate respondsToSelector:@selector(pickerCollectionViewSelectCamera:withImage:)]){
            [self.delegate pickerCollectionViewSelectCamera:self withImage:noti.userInfo[@"image"]];
        }
    });
}

#pragma mark - 监听点击Done按钮
- (void)done:(NSNotification *)note{
    NSArray *selectArray =  note.userInfo[@"selectAssets"];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(pickerViewControllerDoneAsstes:)]) {
            [self.delegate pickerViewControllerDoneAsstes:selectArray];
        }else if (self.callBack){
            self.callBack(selectArray);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)setDelegate:(id<PhotoPickerViewControllerDelegate>)delegate{
    _delegate = delegate;
    self.groupVC.delegate = delegate;
}

@end
