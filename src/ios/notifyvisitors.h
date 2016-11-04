//
//  notifyvisitors.h
//  notifyvisitors
//
//  Created by Siddharth Gupta on 22/01/16.
//  Copyright © 2016 notifyvisitors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Cordova/CDVPlugin.h>

@interface notifyvisitors : NSObject

+(void)setupWithBrandId:(int)brandId secretkey:(NSString*)encryptedKey;
+(void)Show:(NSMutableDictionary *)UserTokens CustomRule:(NSMutableDictionary *)customRule;
+(void)UserIdentifier:(NSString *)userID UserParams:(NSMutableDictionary *)UserParams;
+(void)checkSetupComplete:(NSTimer *)timer;
+(void)RegisterForPushNotification:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions brandId:(int)brandId secretkey:(NSString*)encryptedKey;

+(void)DidRegisteredNotification:(UIApplication *)application deviceToken:(NSData *)deviceToken;
+(void)didReceiveNotifyvisitorsPushNotification:(UIApplication *)application window:(UIWindow *)window Notification:(NSDictionary *)userInfo;

+(void)scrollViewDidScroll:(UIScrollView *)scrollView;
+(BOOL)isScrolled:(NSString *)NotificationID;
+(void)trackEvents:(NSString *)event_name Attributes:(NSMutableDictionary *)attributes lifetimeValue:(NSString *)ltv Scope:(int)scope;

+(void)schedulePushNotificationwithNotificationID:(NSString *)NID Tag:(NSString *)tag TimeinSecond:(NSString *)time Title:(NSString *)title  Message:(NSString *)message URL:(NSString *)url  Icon:(NSString *)icon;
+(void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation brandId:(int)brandId secretkey:(NSString*)secretkey;
+(void)checkFetchClickComplete:(NSTimer *)timer;
+(NSMutableDictionary *)GetNotifyvisitorsPushNotificationData:(UIApplication *)application window:(UIWindow*)window Notification:(NSDictionary *)userInfo;
+(void)NotifyVisitorsNotificationCentre;
+(NSInteger)GetUnreadPushNotification;
+(UIViewController*) topMostController;
+(NSMutableArray *)GetNotificationCentreData;
+(void)NotifyVisitorsGeofencing;
+(void)NotifyVisitorsGeofencingReceivedNotificationWithApplication:(UIApplication *)application window:(UIWindow *)window didReceiveGeofencingNotification:(UILocalNotification *)notification;

+(void)NotifyVisitorsGeofencingApplicationDidEnterBackground;
+(void)NotifyVisitorsGeofencingapplicationDidBecomeActive;
+(void)DismissAllNotifyvisitorsInAppNotifications;
@end
