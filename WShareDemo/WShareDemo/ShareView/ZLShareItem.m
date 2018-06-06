//
//  ZLShareItem.m
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import "ZLShareItem.h"

@implementation ZLShareItem
+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon
                      handler:(void (^)(ZLShareItem *item))handler
{
    ZLShareItem *item = [ZLShareItem new];
    item.title = title;
    item.icon = icon;
    item.didSelectionHandler  = handler;
    
    return item;
}
@end
