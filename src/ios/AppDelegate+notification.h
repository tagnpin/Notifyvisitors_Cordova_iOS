//
//  AppDelegate+notification.h
//  pushtest
//
//  Created by Robert Easterday on 10/26/12.
//
//

#import "AppDelegate.h"

@interface AppDelegate (notification)
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;
-(BOOL)application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation;
- (id) getCommandInstance:(NSString*)className;

@property (nonatomic, retain) NSDictionary	*launchNotification;
@end
