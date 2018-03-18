//
//  AppDelegate.m
//  MessageForwarding
//
//  Created by AK on 2018/3/18.
//  Copyright © 2018年 yoyo. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1,给一个nil发送消息
    Person * p1 = nil;
    NSLog(@"my age is :%d",[p1 age]);

    /////////////////////////////////////////////
    //2,给一个野指针发送消息 会 crash
    /*
    Person * p2 = [[Person alloc] init];
    [p2 release];
    //XXXXX 对一个object做了release之后，这个object的引用计数会立即减1，但这个object并不一定就立即被free了。直到其引用计数变成0的时候，它才可能真正被free掉 在没 free 之前 调用age 加一句log 就是等free了再调用 age 才会crash. 使用 sleep(10)效果是一样的,是不是有同学有时候加一句log后就有不同的运行结果可以查看是不是同样问题
    NSLog(@"p2 count %ld",[p2 retainCount]);
    NSLog(@"my age is :%d",[p2 age]);
    */
    
    ///////////////////////////////////////////
    //3,调用一个定义了但没有实现的方法
    Person * p3 = [Person new];
    [p3 run];
    [Person number];
 
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


@end
