var win = Ti.UI.createWindow({
  backgroundColor : 'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

// This is a test id, replace with a real one in production.
var id = (Ti.Platform.osname == 'android') ? "ca-app-pub-3940256099942544/5224354917" : "ca-app-pub-3940256099942544/1712485313";

// Make sure you add the following to your tiapp.xml (for Android)
//  <android xmlns:android="http://schemas.android.com/apk/res/android">
//    <manifest>
//      <application>
//        <meta-data android:name="com.google.android.gms.version"
// android:value="@integer/google_play_services_version"/>
//        ...
//      </application>
//    </manifest>
// </android>
var admobrewarded = require('net.birdirbir.admobrewarded');

var instance = admobrewarded.createAd({
  adUnitID : id
});

// Add listeners. Note that you need to show the ad after the
// AD_REWARDED_VIDEO_AD_LOADED event.
instance.addEventListener(admobrewarded.AD_REWARDED, function(e) {
  Ti.API.warn('reward amount: ', e.rewardAmount);
  Ti.API.warn('reward type: ', e.rewardType);
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_LEFT_APPLICATION, function() {
  Ti.API.warn('left application');
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_AD_CLOSED, function() {
  Ti.API.warn('ad closed');
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_FAILED_TO_LOAD, function(e) {
  Ti.API.warn('ad failed to load: ', e.errorCode);
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_AD_LOADED, function() {
  Ti.API.warn('video ad loaded');
  instance.show();
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_AD_OPENED, function() {
  Ti.API.warn('video ad opened');
});
instance.addEventListener(admobrewarded.AD_REWARDED_VIDEO_STARTED, function() {
  Ti.API.warn('video ad started');
});

// Load the ad.
instance.loadAd();
