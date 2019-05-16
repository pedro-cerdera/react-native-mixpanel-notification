//
//  ModuleWithEmitter.m
//  falafreud
//
//  Created by Pedro Cerdeirinha on 14/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//


#import "ModuleWithEmitter.h"

@implementation ModuleWithEmitter
RCT_EXPORT_MODULE();

- (void)startObserving {
  for (NSString *event in [self supportedEvents]) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:event
                                               object:nil];
  }
}

- (void)handleNotification:(NSNotification *)notification {
  [self sendEventWithName:notification.name body:notification.userInfo];
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

+ (void)sendEventWithName:(NSString *)name withBody:(NSDictionary *)body {
  [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:body];
}

- (NSArray<NSString *> *)supportedEvents {
  return @[@"MixPanelMessages"];
}

@end
