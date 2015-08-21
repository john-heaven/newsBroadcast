//
//  receiveView.h
//  newsBroadcast
//
//  Created by Mac_jiang on 15/8/21.
//  Copyright (c) 2015年 Mac_jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

typedef void (^returnBlock)(NSString *titleText);

@interface receiveView : UIViewController<returnTitle>

@property (strong, nonatomic) IBOutlet UILabel *receiveTitle;
@property (assign,nonatomic) NSString *labelStr;

@property (nonatomic,copy) returnBlock returnblock;

-(void)returnBlockValue:(returnBlock)block;

@end
