//
//  BDBaseViewController.h
//  MiYun360
//
//  Created by 李勇 on 16/3/7.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BackButtonHandlerProtocol <NSObject>
@optional
//点击返回按钮时做特殊处理的时候 实现这个协议方法
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property (assign, nonatomic) id<BackButtonHandlerProtocol> backButtonDelegate;
- (void)setNavTitle:(NSString *)title;

- (void)hideLeftBarButtonItemImage;

@end
