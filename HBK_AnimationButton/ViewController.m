//
//  ViewController.m
//  HBK_AnimationButton
//
//  Created by 黄冰珂 on 2018/5/30.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "ViewController.h"

/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    self.btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn.userInteractionEnabled = NO;
    [self.btn setTitle:@"" forState:(UIControlStateNormal)];
    self.btn.backgroundColor = [UIColor redColor];
    self.btn.frame = CGRectMake((ScreenW-100)/2, (ScreenH-100)/2, 100, 100);
    [self.view addSubview:self.btn];
    
    [self startTimer];
}


- (void)startTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)animationMethod:(UIButton *)sender {
    sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:1.0 animations:^{
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        sender.transform = CGAffineTransformMakeScale(1, 1);
    }];
    sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
}

- (void)timerAction {
    [self animationMethod:self.btn];
}
- (void)tap:(UITapGestureRecognizer *)sender {
    CGPoint touchPoint = [sender locationInView:self.view];
    if ([self.btn.layer.presentationLayer hitTest:touchPoint]) {
        NSLog(@"~~~~~~~~~~~~~~~");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
