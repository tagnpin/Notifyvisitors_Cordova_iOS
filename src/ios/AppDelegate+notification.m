//
//  AppDelegate+notification.m
//  pushtest
//
//  Created by Robert Easterday on 10/26/12.
//
//

#import "AppDelegate+notification.h"
#import "notifyvisitors.h"
#import <objc/runtime.h>
#define NotifyVisitors_BrandId [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"nv_BrandID"]intValue]
#define Notifyvisitors_SecretKey [[NSBundle mainBundle] objectForInfoDictionaryKey:@"nv_SecretKey"]

static char launchNotificationKey;

@implementation AppDelegate (notification)

- (id) getCommandInstance:(NSString*)className
{
	return [self.viewController getCommandInstance:className];
}

// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.
+ (void)load
{
    Method original, swizzled;

    original = class_getInstanceMethod(self, @selector(init));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_init));
    method_exchangeImplementations(original, swizzled);
}

- (AppDelegate *)swizzled_init
{
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createNotificationChecker:) name:@"UIApplicationDidFinishLaunchingNotification" object:nil];
	return [self swizzled_init];
}

// This code will be called immediately after application:didFinishLaunchingWithOptions:. We need
// to process notifications in cold-start situations

- (void)createNotificationChecker:(NSNotification *)notification
{

	if (notification)
	{
		NSDictionary *launchOptions = [notification userInfo];
		if (launchOptions)
			self.launchNotification = [launchOptions objectForKey: @"UIApplicationLaunchOptionsRemoteNotificationKey"];
	}
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
[notifyvisitors setupWithBrandId:NotifyVisitors_BrandId secretkey:Notifyvisitors_SecretKey];
[notifyvisitors RegisterForPushNotification:application launchOptions:launchOptions brandId:NotifyVisitors_BrandId secretkey:Notifyvisitors_SecretKey];

		return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
 [notifyvisitors DidRegisteredNotification:application deviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Error:%@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//To show push notification content inside AlertView use the follwing method.

    [notifyvisitors didReceiveNotifyvisitorsPushNotification:application window:self.window Notification:userInfo];
// if you want push notification content as json you can get it inside a MutableDictionary from following method.It is an optional method.

//NSMutableDictionary *PushData = [notifyvisitors GetNotifyvisitorsPushNotificationData:application window:self.window Notification:userInfo];
//NSLog(@"Received Push Notification Data = %@",PushData);
    }

- (void)applicationDidEnterBackground:(UIApplication *)application {
[notifyvisitors NotifyVisitorsGeofencingApplicationDidEnterBackground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [notifyvisitors NotifyVisitorsGeofencingapplicationDidBecomeActive];
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [notifyvisitors NotifyVisitorsGeofencingReceivedNotificationWithApplication:application window:self.window didReceiveGeofencingNotification:notification];
}

-(BOOL)application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
[notifyvisitors application:application openURL:url sourceApplication:sourceApplication annotation:annotation brandId:NotifyVisitors_BrandId secretkey:Notifyvisitors_SecretKey];
    return YES;
}


// The accessors use an Associative Reference since you can't define a iVar in a category
// http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/objectivec/Chapters/ocAssociativeReferences.html
- (NSMutableArray *)launchNotification
{
   return objc_getAssociatedObject(self, &launchNotificationKey);
}

- (void)setLaunchNotification:(NSDictionary *)aDictionary
{
    objc_setAssociatedObject(self, &launchNotificationKey, aDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dealloc
{
    self.launchNotification	= nil; // clear the association and release the object
}

@end
