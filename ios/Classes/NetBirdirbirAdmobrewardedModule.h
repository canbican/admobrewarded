/**
 * admobrewarded-ios
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "TiModule.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <GoogleMobileAds/GADRewardBasedVideoAdDelegate.h>
#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GADRewardBasedVideoAd.h>


@interface NetBirdirbirAdmobrewardedModule : TiModule
{
}
#define LAD_REWARDED @"ad_rewarded"
#define LAD_REWARDED_VIDEO_LEFT_APPLICATION @"ad_rewarded_left_app"
#define LAD_REWARDED_VIDEO_AD_CLOSED @"ad_rewarded_ad_closed"
#define LAD_REWARDED_VIDEO_FAILED_TO_LOAD @"ad_rewarded_failed_to_load"
#define LAD_REWARDED_VIDEO_AD_LOADED @"ad_rewarded_video_ad_loaded"
#define LAD_REWARDED_VIDEO_AD_OPENED @"ad_rewarded_video_ad_opened"
#define LAD_REWARDED_VIDEO_STARTED @"ad_rewarded_video_started"

@end
