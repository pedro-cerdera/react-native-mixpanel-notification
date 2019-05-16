#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RNMixpanelNotification : NSObject <RCTBridgeModule>
+ (void)sendEventWithName:(NSString *)name withBody:(NSDictionary *)body;
@end

