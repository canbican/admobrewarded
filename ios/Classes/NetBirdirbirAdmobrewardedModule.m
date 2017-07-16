/**
 * admobrewarded-ios
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "NetBirdirbirAdmobrewardedModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@implementation NetBirdirbirAdmobrewardedModule

MAKE_SYSTEM_STR(AD_REWARDED, LAD_REWARDED)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_LEFT_APPLICATION, LAD_REWARDED_VIDEO_LEFT_APPLICATION)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_AD_CLOSED, LAD_REWARDED_VIDEO_AD_CLOSED)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_FAILED_TO_LOAD, LAD_REWARDED_VIDEO_FAILED_TO_LOAD)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_AD_LOADED, LAD_REWARDED_VIDEO_AD_LOADED)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_AD_OPENED, LAD_REWARDED_VIDEO_AD_OPENED)
MAKE_SYSTEM_STR(AD_REWARDED_VIDEO_STARTED, LAD_REWARDED_VIDEO_STARTED)

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
    return @"1718e13a-2279-4630-8b5b-77821fa685a6";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
    return @"net.birdirbir.admobrewarded";
}

#pragma mark Lifecycle

-(void)startup
{
    // this method is called when the module is first loaded
    // you *must* call the superclass
    [super startup];
    
    NSLog(@"[DEBUG] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
    // this method is called when the module is being unloaded
    // typically this is during shutdown. make sure you don't do too
    // much processing here or the app will be quit forceably
    
    // you *must* call the superclass
    [super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
    // optionally release any resources that can be dynamically
    // reloaded once memory is available - such as caches
    [super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
    if (count == 1 && [type isEqualToString:@"my_event"])
    {
        // the first (of potentially many) listener is being added
        // for event named 'my_event'
    }
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
    if (count == 0 && [type isEqualToString:@"my_event"])
    {
        // the last listener called for event named 'my_event' has
        // been removed, we can optionally clean up any resources
        // since no body is listening at this point for that event
    }
}

@end
