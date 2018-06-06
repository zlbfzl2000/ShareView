//
//  ZLShareSheetView.m
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import "ZLShareSheetView.h"
#import "ZLShareSheetCell.h"

#define ZL_TitleHeight  20.f

#define ZL_TitlePadding 10.f

@interface ZLShareSheetView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ZLShareSheetView
-(instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    self.backgroundColor = [UIColor whiteColor];
    _titleLabel= ({
          UILabel *iv = [[UILabel alloc] init];
        iv = [[UILabel alloc] init];
        iv.textColor = UIColorFromRGB(0x777777);
        iv.text = @"分享";
        iv.textAlignment = NSTextAlignmentCenter;
        iv.font = FontPingFangSC(14);
        [self addSubview:iv];
        iv;
    });
    
    _tableView =({
        UITableView*listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        listView.tableFooterView =[UIView new];
        listView.rowHeight = ZL_ItemCellHeight;
        listView.bounces = NO;
        listView.dataSource = self;
        listView.delegate = self;
        [self addSubview:listView];
        listView;
    });
    _cancelButton= ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn = [[UIButton alloc] init];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x777777) forState:UIControlStateNormal];
        btn.titleLabel.font = FontPingFangSC(14);
        [btn addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn;
    });
 
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 标题
    self.titleLabel.frame = CGRectMake(0, ZL_TitlePadding, ZL_ScreenWidth, self.titleHeight);
    // 取消按钮
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)
                                      +ZL_TitlePadding, ZL_ScreenWidth, self.dataArray.count * ZL_ItemCellHeight);
    self.cancelButton.frame = CGRectMake(0, self.frame.size.height - ZL_CancelButtonHeight, ZL_ScreenWidth, ZL_CancelButtonHeight);
}

#pragma mark - Action

- (void)cancelButtonClick
{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *itemArray = self.dataArray[indexPath.row];
    
    ZLShareSheetCell *cell = [ZLShareSheetCell cellWithTableView:tableView];
    
    cell.itemArray = itemArray;
    
    return cell;
}
#pragma mark 适配ios11
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   return 0.1f;
    
}

#pragma mark - setter

- (void)setShareArray:(NSArray *)shareArray
{
    _shareArray = shareArray;
    if (shareArray.count) {
        [self.dataArray addObject:shareArray];
    }
}
- (void)setFunctionArray:(NSArray *)functionArray
{
    _functionArray = functionArray;
    if (functionArray.count) {
        [self.dataArray addObject:functionArray];
    }
}
#pragma mark - getter
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (CGFloat)shareSheetHeight
{
    return self.initialHeight + self.dataArray.count * ZL_ItemCellHeight - 1 +  2*ZL_TitlePadding;
}

- (CGFloat)initialHeight
{
    return ZL_CancelButtonHeight + self.titleHeight;
}

- (CGFloat)titleHeight
{
    return self.titleLabel.text.length ? ZL_TitleHeight : 0;
}
@end
