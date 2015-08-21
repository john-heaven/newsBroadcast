//
//  ViewController.h
//  newsBroadcast
//
//  Created by Mac_jiang on 15/8/21.
//  Copyright (c) 2015年 Mac_jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol returnTitle
-(void)passTitle:(NSString *)titleText;
@end

@interface ViewController : UIViewController

@property (nonatomic,assign) id<returnTitle>passValueDelegate;

@end

