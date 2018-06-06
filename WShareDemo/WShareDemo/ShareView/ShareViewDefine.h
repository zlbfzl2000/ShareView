//
//  ShareViewDefine.h
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#ifndef ShareViewDefine_h
#define ShareViewDefine_h


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define FontPingFangSC(Size)  [UIFont fontWithName:@"PingFangSC-Regular" size:Size*kScreenScale] 

#define FontNormal(Size) [UIFont systemFontOfSize:Size*kScreenScale]

#define ZL_HideNotification         @"ZL_HideNotification"

#define ZL_ScreenHeight             [UIScreen mainScreen].bounds.size.height
#define ZL_ScreenWidth              [UIScreen mainScreen].bounds.size.width

#define ZL_CancelButtonHeight       kNumber(44.f)    // 取消按钮的高度
#define ZL_ItemCellHeight           kNumber(123.f)   // 每个item的高度
#define ZL_ItemCellWidth            kNumber(88)    // 每个item的宽度
#define ZL_ItemCellPadding          kNumber(14.f)    // item之间的距离

#define ZL_AnimateDuration          0.3     // 动画时间
#define ZL_DimBackgroundAlpha       0.3     // 半透明背景的alpha值
#define kNumber(num)                      (num*kScreenScale)


#define kScreenScale                          (ZL_ScreenWidth / 375.f)

#endif /* ShareViewDefine_h */
