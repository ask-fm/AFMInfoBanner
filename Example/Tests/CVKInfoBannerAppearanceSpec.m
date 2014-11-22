//
//  CVKInfoBannerAppearanceSpec.m
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 22/11/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import "CVKTestCommons.h"

SpecBegin(CVKInfoBannerAppearance)

describe(@"CVKInfoBanner UIAppearance", ^{
    __block CVKInfoBanner *banner;

    it(@"should configure error look", ^{
        [[CVKInfoBanner appearance] setErrorBackgroundColor:[UIColor blueColor]];
        [[CVKInfoBanner appearance] setErrorTextColor:[UIColor blackColor]];

        banner = bannerFromHelper(kShortBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should configure info look", ^{
        [[CVKInfoBanner appearance] setInfoBackgroundColor:[UIColor blackColor]];
        [[CVKInfoBanner appearance] setInfoTextColor:[UIColor yellowColor]];

        banner = bannerFromHelper(kShortBannerText, CVKInfoBannerStyleGreen);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    it(@"should configure font", ^{
        [[CVKInfoBanner appearance] setFont:[UIFont systemFontOfSize:20]];

        banner = bannerFromHelper(kLongBannerText, CVKInfoBannerStyleRed);
        expect(banner).will.haveValidSnapshotNamed(deviceSpecificName());
    });

    afterEach(^{
        [banner removeFromSuperview];

        [[CVKInfoBanner appearance] setErrorBackgroundColor:nil];
        [[CVKInfoBanner appearance] setErrorTextColor:nil];
        [[CVKInfoBanner appearance] setInfoBackgroundColor:nil];
        [[CVKInfoBanner appearance] setInfoTextColor:nil];
        [[CVKInfoBanner appearance] setFont:nil];
    });
});

SpecEnd
