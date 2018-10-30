//
//  AppDelegate.h
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-10.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class ViewController_iPhone;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController_iPhone *viewController_iPhone;


-(void)addNewLocalClockNotification;
-(void)cancelLocalClockNotifation;


@end
