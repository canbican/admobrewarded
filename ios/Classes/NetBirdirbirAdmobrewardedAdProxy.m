/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "NetBirdirbirAdmobrewardedAdProxy.h"
#import "TiUtils.h"
#import "TiApp.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@implementation NetBirdirbirAdmobrewardedAdProxy

-(void)loadAd:(id)args
{
    [GADRewardBasedVideoAd sharedInstance].delegate = self;
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID: [self valueForKey:@"adUnitID"]];
}

-(void)show:(id)args
{
    [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:[[[TiApp app] controller] topPresentedController]];
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
   didRewardUserWithReward:(GADAdReward *)reward {
    [self fireEvent:LAD_REWARDED withObject:@{@"rewardType": reward.type , @"rewardAmount": reward.amount}];
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    [self fireEvent:LAD_REWARDED_VIDEO_AD_LOADED withObject:@{@"isReady": NUMBOOL([[GADRewardBasedVideoAd sharedInstance] isReady])}];
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    [self fireEvent:LAD_REWARDED_VIDEO_AD_OPENED];
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    [self fireEvent:LAD_REWARDED_VIDEO_STARTED];
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    [self fireEvent:LAD_REWARDED_VIDEO_AD_CLOSED];
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    [self fireEvent:LAD_REWARDED_VIDEO_LEFT_APPLICATION];
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error {
    [self fireEvent:LAD_REWARDED_VIDEO_FAILED_TO_LOAD withObject:@{@"error":error.localizedDescription}];
}


@end
