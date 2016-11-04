#import <Cordova/CDVPlugin.h>

@interface notifyvisitors_cordova : CDVPlugin
//- (void)setupWithBrandId:(CDVInvokedUrlCommand*)command;
- (void)Show:(CDVInvokedUrlCommand*)command;
- (void)UserIdentifier:(CDVInvokedUrlCommand*)command;
- (void)scrollViewDidScroll:(CDVInvokedUrlCommand*)command;
- (void)trackEvents:(CDVInvokedUrlCommand*)command;
- (void)schedulePushNotificationwithNotificationID:(CDVInvokedUrlCommand*)command;
- (void)NotifyVisitorsNotificationCentre:(CDVInvokedUrlCommand*)command;
- (void)GetUnreadPushNotification:(CDVInvokedUrlCommand*)command;
- (void)GetNotificationCentreData:(CDVInvokedUrlCommand*)command;
- (void)DismissAllNotifyvisitorsInAppNotifications:(CDVInvokedUrlCommand*)command;
-(void)NSNotificationObserverforViewController:(CDVInvokedUrlCommand*)command;
@end
