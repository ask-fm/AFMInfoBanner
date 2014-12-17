//
//  AFMInfoBannerSpec.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 18/11/14.
//  Copyright (c) 2014 Ask.fm Europe, Ltd. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import "AFMInfoBanner.h"
#import "AFMTestCommons.h"

SpecBegin(AFMInfoBanner)

describe(@"AFMInfoBanner view", ^{
    __block AFMInfoBanner *banner;

    it(@"should show compact red one", ^{
        banner = bannerFromHelper(kShortBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kShortBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should show long red one", ^{
        banner = bannerFromHelper(kLongBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kLongBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should show compact green one", ^{
        banner = bannerFromHelper(kShortBannerText, AFMInfoBannerStyleInfo);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
        [banner removeFromSuperview];
        banner = bannerManual(kShortBannerText, AFMInfoBannerStyleInfo);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    afterEach(^{
        [banner removeFromSuperview];
    });
});

SpecEnd
