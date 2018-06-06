//
//  ZLShareView.h
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewDefine.h"
#import "ZLShareItem.h"
@interface ZLShareView : UIView

@property (nonatomic, readonly) UILabel *titleLabel;

@property (nonatomic, readonly) UIButton *cancelButton;

/**
 
 */
+ (instancetype)shareViewWithShareTiles:(NSArray *)titles icons:(NSArray *)icon itemDidSelected:(void (^)(ZLShareItem *item))didSelectedBlock;
/**

 @param titles <#titles description#>
 @param icon <#icon description#>
 @param functionArray <#functionArray description#>
 @param didSelectedBlock <#didSelectedBlock description#>
 @return <#return value description#>
 */
+ (instancetype)shareViewWithShareTiles:(NSArray *)titles icons:(NSArray *)icon  functionItems:(NSArray *) functionArray  functionIcons:(NSArray *)functionIcons  itemDidSelected:(void (^)(ZLShareItem *item))didSelectedBlock;

/**
 */
- (void)show;
/**
 */
- (void)hide;

@end
