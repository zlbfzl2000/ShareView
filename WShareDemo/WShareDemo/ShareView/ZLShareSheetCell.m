//
//  ZLShareSheetCell.m
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import "ZLShareSheetCell.h"
#import "ShareViewDefine.h"
#import "ZLShareItem.h"
#import "ZLShareItemCell.h"

@interface ZLShareSheetCell()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation ZLShareSheetCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ZLShareSheetCell";
    
    ZLShareSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[ZLShareSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

-(void)setupUI{
    
    _collectionView = ({
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, kNumber(10), 0, kNumber(10));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(ZL_ItemCellWidth, ZL_ItemCellHeight);
        UICollectionView*collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        collectionView.alwaysBounceHorizontal = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        [collectionView registerClass:[ZLShareItemCell class] forCellWithReuseIdentifier:NSStringFromClass([ZLShareItemCell class])];
        [self.contentView addSubview:collectionView];
        collectionView;
    });
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    UICollectionView *collectionView = self.collectionView;
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(collectionView);
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collectionView]|"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];
}

#pragma mark - UICollectionViewDataSource  UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZLShareItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZLShareItemCell class]) forIndexPath:indexPath];
    
    ZLShareItem *item = self.itemArray[indexPath.item];
    
    cell.item = item;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZLShareItem *item = self.itemArray[indexPath.item];

    if (item.didSelectionHandler) {
        item.didSelectionHandler(item);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
