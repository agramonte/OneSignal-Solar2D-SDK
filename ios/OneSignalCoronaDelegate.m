#import <OneSignal/OneSignal.h>
#import "OneSignal.h"
#import "OneSignalCoronaDelegate.h"
#import "OneSignalHelper.h"
#import <objc/runtime.h>

@implementation OneSignalCoronaDelegate : NSObject

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    
    // Dynamically add oneSignalApplicationWillTerminate: to CoronaAppDelegate if missing
    Class coronaDelegateClass = NSClassFromString(@"CoronaAppDelegate");
    SEL selector = @selector(oneSignalApplicationWillTerminate:);
    if (coronaDelegateClass && !class_getInstanceMethod(coronaDelegateClass, selector)) {
        class_addMethod(
            coronaDelegateClass,
            selector,
            (IMP)oneSignalApplicationWillTerminateDynamic,
            "v@:@"
        );
    }

    return true;
}

// The dynamic implementation (can be static or global)
static void oneSignalApplicationWillTerminateDynamic(id self, SEL _cmd, UIApplication *application) {
    // No-op or add logging if you want
}

- (void)applicationWillResignActive:(UIApplication*)application {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"applicationWillResignActive:application"];
   
    
}

- (void)applicationDidBecomeActive:(UIApplication*)application {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"applicationDidBecomeActive:application"];
    
    if ([OneSignal appId]) {
        
    }
}

- (void)application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)inDeviceToken {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"application:app didRegisterForRemoteNotificationsWithDeviceToken:inDeviceToken"];
    
    if ([OneSignal appId]) {
        
    }
}

- (void)application:(UIApplication*)app didFailToRegisterForRemoteNotificationsWithError:(NSError*)err {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"application:app didFailToRegisterForRemoteNotificationsWithError:err"];
    
    if ([OneSignal appId]) {
        
    }
        
}

- (void)application:(UIApplication*)app didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"application:app didRegisterUserNotificationSettings:notificationSettings"];
    
    if ([OneSignal appId]) {
        //[OneSignal updateNotificationTypes:[notificationSettings types]];
    }
}

// Notification opened! iOS 6 ONLY!
//     gameThriveRemoteSilentNotification gets called on iOS 7 & 8
- (void)application:(UIApplication*)app didReceiveRemoteNotification:(NSDictionary*)userInfo {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"application:app didReceiveRemoteNotification:userInfo"];

    if ([OneSignal appId]) {
        // This delegate method is for older iOS versions and the OneSignal SDK now handles this automatically.
        // The original call was to `handleNotificationOpened`, a private method that has been removed in the new SDK
        // and would cause a crash. It also contained a bug where `isActive` was incorrectly a pointer.
    }
}

// Notification opened or silent one received on iOS 7 & 8
- (void)application:(UIApplication*)app didReceiveRemoteNotification:(NSDictionary*)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult)) completionHandler {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE  message:@"application:app didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler"];
    
    if ([OneSignal appId])
    {
        
    }
       
}

- (void)application:(UIApplication*)app handleActionWithIdentifier:(NSString*)identifier forLocalNotification:(UILocalNotification*)notification completionHandler:(void(^)()) completionHandler {
  [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE message:@"application:app handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler"];
   
    // UILocalNotification is deprecated. The OneSignal SDK handles new UNUserNotifications automatically.
    // This call is to a removed private API and would cause a crash.
    // [OneSignal processLocalActionBasedNotification:notification identifier:identifier];
}

- (void)application:(UIApplication*)app didReceiveLocalNotification:(UILocalNotification*)notification {
    [OneSignalLog onesignalLog:ONE_S_LL_VERBOSE  message:@"application:app didReceiveLocalNotification:notification"];
    
    // UILocalNotification is deprecated. The OneSignal SDK handles new UNUserNotifications automatically.
    // This call is to a removed private API and would cause a crash.
    // [OneSignal processLocalActionBasedNotification:notification identifier:@"__DEFAULT__"];
}


- (void)willLoadMain:(id<CoronaRuntime>)runtime {}
- (void)didLoadMain:(id<CoronaRuntime>)runtime {}

@end
