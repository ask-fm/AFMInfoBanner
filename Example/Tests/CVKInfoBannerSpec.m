//
//  CVKInfoBannerSpec.m
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 18/11/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import "CVKInfoBanner.h"

static NSString *const kShortBannerText = @"Short error text";
static NSString *const kLongBannerText = @"Longer text which definitely would be shown on multiple lines and wrap.";

static NSString *sanitizedTestName()
{
    SPTSpec *currrentSpec = [[NSThread currentThread] threadDictionary][@"SPTCurrentSpec"];
    NSString *name = [[[currrentSpec.name componentsSeparatedByString:@" test_"] lastObject] stringByReplacingOccurrencesOfString:@"]" withString:@""];
    return name;
}

SpecBegin(CVKInfoBanner)

describe(@"CVKInfoBanner view", ^{
    __block CVKInfoBanner *banner;

    NSString *(^deviceSpecificName)() = ^NSString *() {
        return [NSString stringWithFormat:@"%@-%.0f",
                sanitizedTestName(),
                CGRectGetWidth([[UIScreen mainScreen] bounds])];
    };

    CVKInfoBanner *(^bannerManual)(NSString *, CVKInfoBannerStyle) = ^CVKInfoBanner *(NSString *text, CVKInfoBannerStyle style) {
        CVKInfoBanner *banner = [[CVKInfoBanner alloc] init];
        banner.text = text;
        banner.style = style;
        [banner show:YES];
        return banner;
    };

    CVKInfoBanner *(^bannerFromHelper)(NSString *, CVKInfoBannerStyle) = ^CVKInfoBanner *(NSString *text, CVKInfoBannerStyle style) {
        return [CVKInfoBanner showAndHideWithText:text style:style];
    };


    it(@"should show compact red one", ^{
        banner = bannerFromHelper(kShortBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kShortBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should show long red one", ^{
        banner = bannerFromHelper(kLongBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kLongBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should show compact green one", ^{
        banner = bannerFromHelper(kShortBannerText, CVKInfoBannerStyleGreen);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kShortBannerText, CVKInfoBannerStyleGreen);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    afterEach(^{
        [banner removeFromSuperview];
    });
});

SpecEnd
