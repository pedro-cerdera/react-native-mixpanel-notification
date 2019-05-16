
package com.shellmonger.reactnative;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class RNMixpanelNotificationModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;
  private static WritableMap notification = null;
  private static ReactApplicationContext globalContext;

  public RNMixpanelNotificationModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
    RNMixpanelNotificationModule.globalContext = reactContext;
  }

  public static void setNotification(String mp_message, String mp_message_id, String mp_campaign_id) {
      WritableMap notification = Arguments.createMap();
      notification.putString("mp_message", mp_message);
      notification.putString("mp_message_id", mp_message_id);
      notification.putString("mp_campaign_id", mp_campaign_id);
      RNMixpanelNotificationModule.notification = notification;
      try {
          RNMixpanelNotificationModule.globalContext
                  .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                  .emit("MixPanelMessages", notification);

      } catch (Exception e) {
//          Log.e("ReactNative", "Caught Exception: " + e.getMessage());
      }
  }


  @Override
  public String getName() {
    return "RNMixpanelNotification";
  }

  @ReactMethod
  public void getNotification(final Promise promise) {
      if (RNMixpanelNotificationModule.notification != null){
          promise.resolve(RNMixpanelNotificationModule.notification);
          RNMixpanelNotificationModule.notification = null;
      } else {
          promise.reject("NO_MIXPANEL_NOTIFICATION");
      }
  }

    @ReactMethod
  public void clearNotification(final Promise promise) {
      if (RNMixpanelNotificationModule.notification != null){
          RNMixpanelNotificationModule.notification = null;
      } 
      promise.resolve(true);
  }
}