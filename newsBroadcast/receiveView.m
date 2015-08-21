//
//  receiveView.m
//  newsBroadcast
//
//  Created by Mac_jiang on 15/8/21.
//  Copyright (c) 2015年 Mac_jiang. All rights reserved.
//

#import "receiveView.h"

@implementation receiveView
@synthesize returnblock;

-(void)passTitle:(NSString *)titleText{
    self.labelStr =titleText;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.receiveTitle.text = self.labelStr;
    self.title = self.receiveTitle.text;

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(come:) name:@"come" object:nil];
}

-(void)come:(NSNotification *)notification{
    self.receiveTitle.text = [[notification userInfo]objectForKey:@"title"];
    self.title = self.receiveTitle.text;
}

-(void)returnBlockValue:(returnBlock)block{
    returnblock = block;
}

-(void)viewDidDisappear:(BOOL)animated{
    if (returnblock!=nil) {
        returnblock(self.receiveTitle.text);
    }
}

@end
