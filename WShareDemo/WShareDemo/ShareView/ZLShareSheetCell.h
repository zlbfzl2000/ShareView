//
//  ZLShareSheetCell.h
//  WithYou
//
//  Created by Snow_lu on 2017/4/23.
//  Copyright © 2017年 捷酷有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLShareSheetCell : UITableViewCell

@property (nonatomic, strong) NSArray *itemArray;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
