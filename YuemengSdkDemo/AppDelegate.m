//
//  AppDelegate.m
//  BroadcastSdkDemo
//
//  Created by wangdh on 2016/11/11.
//  Copyright © 2016年 wangdh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BookStoreMgr.h"
#import <BUAdSDK/BUAdSDKManager.h>
#import "TabViewController.h"

@interface DemoAppDelegate ()

@property (nonatomic, strong) BookStoreMgr *bookStoreMgr;
@property (nonatomic, strong) TabViewController *rootController;

@end

@implementation DemoAppDelegate

-(BookStoreMgr *)getBookStoreMgr
{
    return _bookStoreMgr;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [self.window makeKeyAndVisible];
    //self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    //书城SDK模块初始化
    _bookStoreMgr = [[BookStoreMgr alloc] init];
    
#if 1
    _rootController = [[ViewController alloc] init];
    [_rootController setBookStoreMgr:_bookStoreMgr];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:_rootController];
    [self.window setRootViewController:navController];
    
#else
    _rootController = [[TabViewController alloc] init];
    [(TabViewController *)_rootController setBookStoreMgr:_bookStoreMgr];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:_rootController];
    [self.window setRootViewController:navController];
#endif
    
//    if (launchOptions)
//    {
//        NSURL *url = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
//        [_rootController handleOpenURL:url];
//    }

#if 1
    [BUAdSDKManager setAppID:@"5001096"];
    [BUAdSDKManager setIsPaidApp:NO];
#endif
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
//    if ([_rootController handleOpenURL:url]){
//        return YES;
//    }
    
    return YES;
}

@end
