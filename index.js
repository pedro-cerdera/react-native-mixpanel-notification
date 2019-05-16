
import { NativeModules, NativeEventEmitter, Platform, DeviceEventEmitter } from 'react-native';

const { RNMixpanelNotification, ModuleWithEmitter } = NativeModules;

export default class MixPanelNotification {

    static addListener(func) {
        if (Platform.OS === 'ios') {
            const eventEmitter = new NativeEventEmitter(ModuleWithEmitter);
            eventEmitter.addListener('MixPanelMessages', (e) => {
                func(e);
                RNMixpanelNotification.clearNotification();
            });
        } else if (Platform.OS === 'android') {
            DeviceEventEmitter.addListener('MixPanelMessages', (e) => {
                func(e);
                RNMixpanelNotification.clearNotification();
            });
        }
    }

    static async getNotification() {
        try {
            const notification = await RNMixpanelNotification.getNotification();
            return notification
        } catch (e) {
            return null;
        }
    }

}
