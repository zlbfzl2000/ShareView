//
//  ViewController.m
//  WShareDemo
//
//  Created by snowlu on 2018/6/6.
//  Copyright © 2018年 LittleShrimp. All rights reserved.
//

#import "ViewController.h"
#import "ZLShareView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Click:(id)sender {
    ZLShareView  *shareView = [ZLShareView shareViewWithShareTiles:@[@"QQ好友",@"QQ空间",@"微信",@"朋友圈",@"QQ好友",@"QQ空间",@"微信",@"朋友圈"] icons:@[@"ShareQQ",@"zone",@"wechat",@"friends",@"ShareQQ",@"zone",@"wechat",@"friends"] itemDidSelected:^(ZLShareItem *item) {
        
    }];
    //功能
    //    ZLShareView  *shareView = [ZLShareView shareViewWithShareTiles:@[@"QQ好友",@"QQ空间",@"微信",@"朋友圈"] icons:@[@"ShareQQ",@"zone",@"wechat",@"friends",@"ShareQQ",@"zone",@"wechat",@"friends"] functionItems:@[@"QQ好友",@"QQ空间",@"微信",@"朋友圈"] functionIcons:@[@"ShareQQ",@"zone",@"wechat",@"friends",@"ShareQQ",@"zone",@"wechat",@"friends"] itemDidSelected:^(ZLShareItem *item) {
    //
    //        NSLog(@"%@",item.title);
    //    }];
    
    
    [shareView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
