
# react-native-mixpanel-notification

## Getting started

`$ npm install react-native-mixpanel-notification --save`

### Mostly automatic installation

`$ react-native link react-native-mixpanel-notification`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-mixpanel-notification` and add `RNMixpanelNotification.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMixpanelNotification.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.shellmonger.reactnative.RNMixpanelNotificationPackage;` to the imports at the top of the file
  - Add `new RNMixpanelNotificationPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-mixpanel-notification'
  	project(':react-native-mixpanel-notification').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-mixpanel-notification/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-mixpanel-notification')
  	```


## Usage
```javascript
import RNMixpanelNotification from 'react-native-mixpanel-notification';

// TODO: What to do with the module?
RNMixpanelNotification;
```
  