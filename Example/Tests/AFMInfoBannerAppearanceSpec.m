//
//  AFMInfoBannerAppearanceSpec.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 22/11/14.
//  Copyright (c) 2014 Ask.fm Europe, Ltd. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import "AFMTestCommons.h"

SpecBegin(AFMInfoBannerAppearance)

describe(@"AFMInfoBanner UIAppearance", ^{
    __block AFMInfoBanner *banner;

    it(@"should configure error look", ^{
        [[AFMInfoBanner appearance] setErrorBackgroundColor:[UIColor blueColor]];
        [[AFMInfoBanner appearance] setErrorTextColor:[UIColor blackColor]];

        banner = bannerFromHelper(kShortBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should configure info look", ^{
        [[AFMInfoBanner appearance] setInfoBackgroundColor:[UIColor blackColor]];
        [[AFMInfoBanner appearance] setInfoTextColor:[UIColor yellowColor]];

        banner = bannerFromHelper(kShortBannerText, AFMInfoBannerStyleInfo);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should configure font", ^{
        [[AFMInfoBanner appearance] setFont:[UIFont systemFontOfSize:20]];

        banner = bannerFromHelper(kLongBannerText, AFMInfoBannerStyleError);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    afterEach(^{
        [banner removeFromSuperview];

        [[AFMInfoBanner appearance] setErrorBackgroundColor:nil];
        [[AFMInfoBanner appearance] setErrorTextColor:nil];
        [[AFMInfoBanner appearance] setInfoBackgroundColor:nil];
        [[AFMInfoBanner appearance] setInfoTextColor:nil];
        [[AFMInfoBanner appearance] setFont:nil];
    });
});

SpecEnd
