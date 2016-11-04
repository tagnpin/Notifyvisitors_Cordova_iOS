var exec = require('cordova/exec');

 exports.Show = function(arg1, success, error) {
 exec(success, error, "notifyvisitors_cordova", "Show", arg1);
  };
exports.UserIdentifier = function(arg2, success, error) {
  exec(success, error, "notifyvisitors_cordova", "UserIdentifier", arg2);
  };

  exports.scrollViewDidScroll = function(arg3, success, error) {
      exec(success, error, "notifyvisitors_cordova", "scrollViewDidScroll", arg3);
       };
  exports.trackEvents = function(arg4, success, error) {
       exec(success, error, "notifyvisitors_cordova", "trackEvents", arg4);
        };
  exports.schedulePushNotificationwithNotificationID = function(arg5, success, error) {
        exec(success, error, "notifyvisitors_cordova", "schedulePushNotificationwithNotificationID", arg5);
         };

  exports.NotifyVisitorsNotificationCentre = function(success, error) {
          exec(success, error, "notifyvisitors_cordova", "NotifyVisitorsNotificationCentre");
          };
  exports.GetUnreadPushNotification = function(success, error) {
  exec(success, error, "notifyvisitors_cordova", "GetUnreadPushNotification");
          };
  exports.GetNotificationCentreData = function(success, error) {
  exec(success, error, "notifyvisitors_cordova", "GetNotificationCentreData");
          };
  exports.NSNotificationObserverforViewController = function(success, error) {
  exec(success, error, "notifyvisitors_cordova", "NSNotificationObserverforViewController");
          };

  exports.DismissAllNotifyvisitorsInAppNotifications = function(success, error) {
          exec(success, error, "notifyvisitors_cordova", "DismissAllNotifyvisitorsInAppNotifications");
          };
  exports.getUrlParameter = function(nvParam,success, error) {
    var PageURL = decodeURIComponent(window.location.search.substring(1));
    var array =[];
    var nvURLVariables = PageURL.split('&');
    for (var i = 0; i < nvURLVariables.length; i++) {
    var nvParameterName = nvURLVariables[i].split('=');
    if (nvParameterName[0] == nvParam) {
    array.push(nvParameterName[1]);
      }
    }
    return array;
  };
