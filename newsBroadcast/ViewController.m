//
//  ViewController.m
//  newsBroadcast
//
//  Created by Mac_jiang on 15/8/21.
//  Copyright (c) 2015年 Mac_jiang. All rights reserved.
//

#import "ViewController.h"
#import "receiveView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize passValueDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//代理传递方法
- (IBAction)delegateBtn:(id)sender {
    UIButton *btn = sender;
    receiveView *receiveview = [self.storyboard instantiateViewControllerWithIdentifier:@"receiveView"];
    self.passValueDelegate = receiveview;
    [self.passValueDelegate passTitle:btn.titleLabel.text];
    [self.navigationController pushViewController:receiveview animated:YES];
}

//通知的传递方法
- (IBAction)notificationBtn:(id)sender {
    receiveView *receiveview = [self.storyboard instantiateViewControllerWithIdentifier:@"receiveView"];
    [self.navigationController pushViewController:receiveview animated:YES];
    [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(sendMessage:) userInfo:sender repeats:NO];
}
//闭包传递方法
- (IBAction)blockBtn:(id)sender {
    UIButton *btn = sender;
    receiveView *receiveview = [self.storyboard instantiateViewControllerWithIdentifier:@"receiveView"];
    receiveview.labelStr =@"返回block就传值了";
    [receiveview returnBlockValue:^(NSString *titleText) {
        btn.titleLabel.text = titleText;
    }];
    [self.navigationController pushViewController:receiveview animated:YES];
}

//直接值传递方法
- (IBAction)directValueBtn:(id)sender {
    UIButton *btn = sender;
    receiveView *receiveview = [self.storyboard instantiateViewControllerWithIdentifier:@"receiveView"];
    receiveview.labelStr =btn.titleLabel.text;
    [self.navigationController pushViewController:receiveview animated:YES];
}

-(void)sendMessage:(NSTimer *)timer{
    UIButton *btn = [timer userInfo];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:btn.titleLabel.text,@"title", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"come" object:nil userInfo:dic];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
