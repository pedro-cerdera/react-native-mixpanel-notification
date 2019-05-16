//
//  ModuleWithEmitter.h
//  falafreud
//
//  Created by Pedro Cerdeirinha on 14/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface ModuleWithEmitter : RCTEventEmitter <RCTBridgeModule>
+ (void)sendEventWithName:(NSString *)name withBody:(NSDictionary *)body;
@end
