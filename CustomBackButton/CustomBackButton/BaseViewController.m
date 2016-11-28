//
//  BDBaseViewController.m
//  MiYun360
//
//  Created by 李勇 on 16/3/7.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
    [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsZero];
    if ([UITableView instancesRespondToSelector:@selector(setLayoutMargins:)]) {
        [[UITableView appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setPreservesSuperviewLayoutMargins:NO];
    }
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage locatilyImage:@"arrow--return"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftbtn;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
}

- (void)setNavTitle:(NSString *)title {
    
    if (_titleLabel) {
        
    }else{
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -80, 44)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.userInteractionEnabled  = YES;
    }
    self.navigationItem.titleView = _titleLabel;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    
    return YES;
}
- (void)dismiss{
    BOOL shouldPop = YES;
    //实现返回按钮做特殊处理
    if([self respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [self.backButtonDelegate navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

- (void)hideLeftBarButtonItemImage{
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = left;
}

@end
