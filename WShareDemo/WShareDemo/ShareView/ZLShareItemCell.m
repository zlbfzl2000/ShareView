//
//  ZLShareItemCell.m
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import "ZLShareItemCell.h"



@interface ZLShareItemCell()
@property (nonatomic, strong) UIButton *iconView;
@property (nonatomic, strong) UITextView *titleView;
@end


@implementation ZLShareItemCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
     _titleView= ({
        UITextView *iv = [[UITextView alloc] init];
         iv.textColor = UIColorFromRGB(0x777777);
         iv.font = FontPingFangSC(12);
         iv.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
         iv.backgroundColor = nil;
         iv.textAlignment = NSTextAlignmentCenter;
         iv.userInteractionEnabled = NO;
         [self.contentView addSubview:iv];
        iv;
    });
    _iconView= ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        [btn addTarget:self
                      action:@selector(iconClick)
            forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.contentView addSubview:self.iconView];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat topPadding = 10.f;
    CGFloat iconView2titleH = 10.f;
    CGFloat cellWidth = self.frame.size.width;
    CGFloat titleInset = 4;
    // 图标
    CGFloat iconViewX = ZL_ItemCellPadding / 2;
    CGFloat iconViewY = topPadding;
    CGFloat iconViewW = cellWidth - ZL_ItemCellPadding;
    CGFloat iconViewH = cellWidth - ZL_ItemCellPadding;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    // 标题
    CGFloat titleViewX = -titleInset;
    CGFloat titleViewY =  iconViewH + iconView2titleH;
    CGFloat titleViewW = cellWidth + 2 * titleInset;
    CGFloat titleViewH = kNumber(20.f);
    self.titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
}
#pragma mark - Actions

- (void)iconClick
{
    if (self.item.didSelectionHandler) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ZL_HideNotification object:nil];
        self.item.didSelectionHandler(self.item);
    }
}
#pragma mark - setter

- (void)setItem:(ZLShareItem *)item
{
    _item = item;
    NSString  *icon  =item.icon;;
    if (icon) {
    [self.iconView setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    }
    self.titleView.text = item.title;
}
@end
