#import "notifyvisitors_cordova.h"
#import "notifyvisitors.h"

@implementation notifyvisitors_cordova

- (void)Show:(CDVInvokedUrlCommand*)command {
  NSMutableDictionary *UserTokens = nil;
     NSMutableDictionary *customRule = nil;
     if ([command.arguments count] > 0) {
     UserTokens = [command.arguments objectAtIndex:0];
         if ([command.arguments count] >1) {
             customRule = [command.arguments objectAtIndex:1];
         }
     }
 [notifyvisitors Show:UserTokens CustomRule:customRule];
}
- (void)UserIdentifier:(CDVInvokedUrlCommand*)command {
  NSString *user_id = nil;
     NSMutableDictionary *userParams = nil;
     if ([command.arguments count] > 0) {
         user_id = [command.arguments objectAtIndex:0];
         if ([command.arguments count] >1) {
             userParams = [command.arguments objectAtIndex:1];
         }
     }
 [notifyvisitors UserIdentifier:user_id UserParams:userParams];
}

- (void)scrollViewDidScroll:(CDVInvokedUrlCommand*)command {
  UIScrollView *scrollView = [command.arguments objectAtIndex:0];
    [notifyvisitors scrollViewDidScroll:scrollView];
}
- (void)trackEvents:(CDVInvokedUrlCommand*)command {
  NSString *EventName = nil;
  NSMutableDictionary *Attribs = nil;
  NSString *nv_ltv = nil;
  int nv_Scope = 0;
    if ([command.arguments count] > 0) {
        EventName = [command.arguments objectAtIndex:0];
        if ([command.arguments count] > 1) {
            Attribs = [command.arguments objectAtIndex:1];
            if ([command.arguments count] > 2) {
                nv_ltv = [command.arguments objectAtIndex:2];
                if ([command.arguments count] > 3) {
                    nv_Scope = [[command.arguments objectAtIndex:3]intValue];
                }
            }
        }
  }
[notifyvisitors trackEvents:EventName Attributes:Attribs lifetimeValue:nv_ltv Scope:nv_Scope];
}
- (void)schedulePushNotificationwithNotificationID:(CDVInvokedUrlCommand*)command {
  NSString *sch_nid = nil;
  NSString *sch_tag = nil;
  NSString *sch_time = nil;
  NSString *sch_title = nil;
  NSString *sch_message = nil;
  NSString *sch_url =nil;
  NSString *sch_icon = nil;
    if ([command.arguments count] > 0) {
          sch_nid = [command.arguments objectAtIndex:0];
          if ([command.arguments count] > 1) {
              sch_tag = [command.arguments objectAtIndex:1];
              if ([command.arguments count] > 2) {
                  sch_time = [command.arguments objectAtIndex:2];
                  if ([command.arguments count] > 3) {
                      sch_title = [command.arguments objectAtIndex:3];
                      if ([command.arguments count] > 4) {
                          sch_message = [command.arguments objectAtIndex:4];
                          if ([command.arguments count] > 5) {
                              sch_url = [command.arguments objectAtIndex:5];
                              if ([command.arguments count] > 6) {
                                  sch_icon = [command.arguments objectAtIndex:6];
                              }
                          }
                      }
                  }
              }
          }
      }
  [notifyvisitors schedulePushNotificationwithNotificationID:sch_nid Tag:sch_tag TimeinSecond:sch_time Title:sch_title Message:sch_message URL:sch_url  Icon:sch_icon];
}

- (void)NotifyVisitorsNotificationCentre:(CDVInvokedUrlCommand*)command {
[notifyvisitors NotifyVisitorsNotificationCentre];
}
- (void)GetUnreadPushNotification:(CDVInvokedUrlCommand*)command {
  CDVPluginResult* pluginResult = nil;
NSInteger UnreadPushCount = [notifyvisitors GetUnreadPushNotification];
  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSInteger:UnreadPushCount];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)GetNotificationCentreData:(CDVInvokedUrlCommand*)command {
  CDVPluginResult* pluginResult = nil;
 NSMutableArray *NotificationCenterData = [notifyvisitors GetNotificationCentreData];
   if ([NotificationCenterData count] > 0) {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:NotificationCenterData];
   } else {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"No Data Found"];
   }
   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)DismissAllNotifyvisitorsInAppNotifications:(CDVInvokedUrlCommand*)command {
[notifyvisitors DismissAllNotifyvisitorsInAppNotifications];
}
-(void)NSNotificationObserverforViewController:(CDVInvokedUrlCommand*)command {
  [[NSNotificationCenter defaultCenter] addObserverForName:@"NVInAppViewConroller" object:nil queue:nil usingBlock:^(NSNotification *notification) {
       CDVPluginResult* pluginResult = nil;
       NSData *userInfoData = [NSJSONSerialization dataWithJSONObject:[notification userInfo] options:0 error:NULL];
       NSString *userInfo = [[NSString alloc] initWithData:userInfoData encoding:NSUTF8StringEncoding];
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[notification userInfo]];
       [self.commandDelegate evalJs:[NSString stringWithFormat:@"app.nv_LoadView(%@)",userInfo]];
   }];
}

@end
