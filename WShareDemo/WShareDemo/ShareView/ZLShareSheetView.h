//
//  ZLShareSheetView.h
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewDefine.h"
@interface ZLShareSheetView : UIView
/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 取消
 */
@property (nonatomic, strong) UIButton *cancelButton;
/**
 分享
 */
@property (nonatomic, strong) NSArray *shareArray;
/**
 功能
 */
@property (nonatomic, strong) NSArray *functionArray;
/**
 标题
 */
@property (nonatomic, copy) void (^cancelBlock)(void);

- (CGFloat)shareSheetHeight;

- (CGFloat)initialHeight;

@end
