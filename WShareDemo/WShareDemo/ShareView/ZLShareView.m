//
//  ZLShareView.m
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import "ZLShareView.h"
#import "ZLShareSheetView.h"
@interface ZLShareView ()
/**
 分享item数组 */
@property (nonatomic, strong) NSArray *shareArray;
/**
 功能item数组
 */
@property (nonatomic, strong) NSArray *functionArray;
/**
 分享面板
 */
@property (nonatomic, strong) ZLShareSheetView *shareSheetView;
/***
 半透明黑色背景
 */
@property (nonatomic, strong) UIView *dimBackgroundView;

@property (nonatomic, strong) UIWindow *window;

@end

@implementation ZLShareView


+ (instancetype)shareViewWithShareTiles:(NSArray *)titles icons:(NSArray *)icon itemDidSelected:(void (^)(ZLShareItem *item))didSelectedBlock
{
    return [self shareViewWithShareTiles:titles icons:icon  functionItems:nil functionIcons:nil itemDidSelected: didSelectedBlock];
}

+ (instancetype)shareViewWithShareTiles:(NSArray *)titles icons:(NSArray *)icons  functionItems:(NSArray *) functionTitles  functionIcons:(NSArray *)functionIcons itemDidSelected:(void (^)(ZLShareItem *item))didSelectedBlock
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];
    //分享
    for (int  i  = 0 ; i <titles.count; i++) {
        NSString *icon ;
        NSString *title ;
        if (icons.count > i) {
            icon =icons[i];
        }
        if (titles.count>i) {
            title = titles[i];
        }
        ZLShareItem *item = [ZLShareItem itemWithTitle:title icon:icon handler:didSelectedBlock];
        [items addObject:item];
    }
    //功能
    NSMutableArray *functionItems = [NSMutableArray arrayWithCapacity:0];
    for (int  i  = 0 ; i <functionTitles.count; i++) {
        NSString *icon ;
        NSString *title ;
        if (functionIcons.count > i) {
            icon =functionIcons[i];
        }
        
        if (functionTitles.count>i) {
            title = functionTitles[i];
        }
        
        ZLShareItem *item = [ZLShareItem itemWithTitle:title icon:icon handler:didSelectedBlock];
        [functionItems addObject:item];
    }
    ZLShareView *shareView = [[ZLShareView alloc] initWithShareItems:items functionItems:functionItems];
    
    return shareView;
}


+ (instancetype)shareViewWithShareItems:(NSArray *)shareArray
                          functionItems:(NSArray *)functionArray
{
    ZLShareView *shareView = [[ZLShareView alloc] initWithShareItems:shareArray functionItems:functionArray];
    return shareView;
}

- (instancetype)initWithShareItems:(NSArray *)shareArray
                     functionItems:(NSArray *)functionArray
{
    if (self = [super init]) {
        self.shareArray = shareArray;
        self.functionArray = functionArray;
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    self.frame = CGRectMake(0, 0, ZL_ScreenWidth, ZL_ScreenHeight);
    _dimBackgroundView = ({
        UIView *iv = [[UIView alloc] init];
        [self addSubview:iv];
        iv.frame = CGRectMake(0, 0, ZL_ScreenWidth, ZL_ScreenHeight);
        iv.backgroundColor = [UIColor blackColor];
        iv.alpha  = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [iv addGestureRecognizer:tap];
        iv;
    });
    
    _shareSheetView = ({
        ZLShareSheetView *iv = [[ZLShareSheetView alloc] init];
        [self addSubview:iv];
        iv.shareArray = self.shareArray;
        iv.functionArray =self.functionArray;
        iv.frame = CGRectMake(0, ZL_ScreenHeight, ZL_ScreenWidth, iv.shareSheetHeight);
        __weak typeof(self) weakSelf = self;
        iv.cancelBlock = ^{
            [weakSelf hide];
        };
        iv;
    });
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hide) name:ZL_HideNotification object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public method

- (void)show
{
    [self addToKeyWindow];
    [self showAnimationWithCompletion:nil];
}

- (void)hide
{
    [self hideAnimationWithCompletion:^(BOOL finished) {
        [self removeFromKeyWindow];
    }];
}

#pragma mark - private method

- (void)addToKeyWindow
{
    if (!self.superview) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:self];
    }
}

- (void)removeFromKeyWindow
{
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)showAnimationWithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:ZL_AnimateDuration animations:^{
        self.dimBackgroundView.alpha = ZL_DimBackgroundAlpha;
        CGRect frame = self.shareSheetView.frame;
        frame.origin.y = ZL_ScreenHeight - self.shareSheetView.shareSheetHeight;
        self.shareSheetView.frame = frame;
    } completion:completion];
}

- (void)hideAnimationWithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:ZL_AnimateDuration animations:^{
        self.dimBackgroundView.alpha = 0;
        CGRect frame = self.shareSheetView.frame;
        frame.origin.y = ZL_ScreenHeight;
        self.shareSheetView.frame = frame;
    } completion:completion];
}
#pragma mark - getter
- (UILabel *)titleLabel
{
    return self.shareSheetView.titleLabel;
}
- (UIButton *)cancelButton
{
    return self.shareSheetView.cancelButton;
}

@end
