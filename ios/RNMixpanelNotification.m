#import "RNMixpanelNotification.h"
#import "ModuleWithEmitter.h"

@implementation RNMixpanelNotification

RCT_EXPORT_MODULE();

+ (void)sendEventWithName:(NSString *)name withBody:(NSDictionary *)body {
    [[NSUserDefaults standardUserDefaults] setObject:body forKey:@"mixpanel_notification"];
    [ModuleWithEmitter sendEventWithName:name withBody:body];
}

RCT_EXPORT_METHOD(getNotification:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
    @synchronized(self) {
        NSDictionary *mixpanel_notification = [[NSUserDefaults standardUserDefaults] objectForKey:@"mixpanel_notification"];
        if (mixpanel_notification) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mixpanel_notification"];
            resolve(mixpanel_notification);
        }else{
            resolve(nil);
        }
    }
}

RCT_EXPORT_METHOD(clearNotification:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
    @synchronized(self) {
        NSDictionary *mixpanel_notification = [[NSUserDefaults standardUserDefaults] objectForKey:@"mixpanel_notification"];
        if (mixpanel_notification) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mixpanel_notification"];
        }
        resolve(nil);
    }
}

@end

