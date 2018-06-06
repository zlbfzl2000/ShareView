//
//  ZLShareItem.h
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareViewDefine.h"
@interface ZLShareItem : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;            
@property (nonatomic, copy) void (^didSelectionHandler)(ZLShareItem *item); 
/**
 *  快速创建方法
 */
+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon
                      handler:(void (^)(ZLShareItem *item))handler;
@end
