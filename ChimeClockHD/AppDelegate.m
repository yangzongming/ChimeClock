//
//  AppDelegate.m
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-10.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "ViewController_iPhone.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize viewController_iPhone = _viewController_iPhone;

- (void)dealloc
{
    [_window release];
    [_viewController_iPhone release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        self.viewController_iPhone = [[[ViewController_iPhone alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.viewController_iPhone];
        [nav.navigationBar setBarStyle:UIBarStyleBlackOpaque];
        self.window.rootViewController = nav;
        [nav release];
    }else{
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
        self.window.rootViewController = self.viewController;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark- 增加一个闹钟

-(void)addNewLocalClockNotification{
    
    [self cancelLocalClockNotifation];
    NSString *timeString = [[NSString stringWithFormat:@"%@",[NSDate date]] substringToIndex:10];
    
    NSArray *array = [NSArray arrayWithObjects:@"00:00:00",@"01:00:00",@"02:00:00",@"03:00:00",@"04:00:00",@"05:00:00",
                      @"06:00:00",@"07:00:00",@"08:00:00",@"09:00:00",@"10:00:00",@"11:00:00",
                      @"12:00:00",@"13:00:00",@"14:00:00",@"15:00:00",@"16:00:00",@"17:00:00",
                      @"18:00:00",@"19:00:00",@"20:00:00",@"21:00:00",@"22:00:00",@"23:00:00",nil];
    
    for(int i=0;i<[array count];++i){
        UILocalNotification *newNotification = [[UILocalNotification alloc] init];
        if (newNotification) {
            //2010-3-3 11:00
            NSString *dateString = [NSString stringWithFormat:@"%@ %@",timeString,[array objectAtIndex:i]];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            newNotification.fireDate = [formatter dateFromString:dateString];
            [formatter release];
            
            newNotification.hasAction = NO;
            newNotification.repeatInterval = kCFCalendarUnitDay;
            //newNotification.alertBody = nil;
            newNotification.soundName = @"hourlychimebeg.m4a";
            //[newNotification setUserInfo:dic];
            [[UIApplication sharedApplication] scheduleLocalNotification:newNotification];
        }
        [newNotification release];
    }
}

-(void)cancelLocalClockNotifation{
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for(UILocalNotification *notification in localNotifications)
    {
        [[UIApplication sharedApplication] cancelLocalNotification:notification];
    }
}


@end
