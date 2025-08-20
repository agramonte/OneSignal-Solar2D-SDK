#import <OneSignal/OneSignal.h>
#import "OneSignalCoronaDelegate.h"
#import "OneSignalHelper.h"
#import "OneSignalLocation.h"

@implementation OneSignalCoronaDelegate : NSObject 

- (void)applicationWillResignActive:(UIApplication*)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication*)application {
   
}

- (void)application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)inDeviceToken {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didRegisterForRemoteNotificationsWithDeviceToken:inDeviceToken"];
    
   if ([OneSignal appId])
        [OneSignal didRegisterForRemoteNotifications:app deviceToken:inDeviceToken];
}

- (void)application:(UIApplication*)app didFailToRegisterForRemoteNotificationsWithError:(NSError*)err {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didFailToRegisterForRemoteNotificationsWithError:err"];
    
    /*if ([OneSignal appId])
        [OneSignal handleDidFailRegisterForRemoteNotification:err];*/
}

- (void)application:(UIApplication*)app didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didRegisterUserNotificationSettings:notificationSettings"];
    
    /*if ([OneSignal appId])
        [OneSignal updateNotificationTypes:[notificationSettings types]];*/
}

// Notification opened! iOS 6 ONLY!
//     gameThriveRemoteSilentNotification gets called on iOS 7 & 8
- (void)application:(UIApplication*)app didReceiveRemoteNotification:(NSDictionary*)userInfo {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didReceiveRemoteNotification:userInfo"];
    
    /*BOOL* isActive = [app applicationState] == UIApplicationStateActive;
    
    if ([OneSignal appId])
        [OneSignal handleNotificationOpened:userInfo
                                   isActive:isActive
                                 actionType:OSNotificationActionTypeOpened
                                displayType:2];*/
}


// Notification opened or silent one received on iOS 7 & 8
- (void)application:(UIApplication*)app didReceiveRemoteNotification:(NSDictionary*)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult)) completionHandler {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler"];
    
    /*if ([OneSignal appId])
        [OneSignal remoteSilentNotification:app UserInfo:userInfo completionHandler:completionHandler];*/
}

- (void)application:(UIApplication*)app handleActionWithIdentifier:(NSString*)identifier forLocalNotification:(UILocalNotification*)notification completionHandler:(void(^)()) completionHandler {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler"];
    
    /*[OneSignal processLocalActionBasedNotification:notification identifier:identifier];*/
}

- (void)application:(UIApplication*)app didReceiveLocalNotification:(UILocalNotification*)notification {
    //[OneSignal onesignal_Log:ONE_S_LL_VERBOSE message:@"application:app didReceiveLocalNotification:notification"];
    
   /* [OneSignal processLocalActionBasedNotification:notification identifier:@"__DEFAULT__"];*/
}

- (void)willLoadMain:(id<CoronaRuntime>)runtime {}
- (void)didLoadMain:(id<CoronaRuntime>)runtime {}

@end
