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

SpecBegin(CVKInfoBanner)

describe(@"CVKInfoBanner", ^{
    __block CVKInfoBanner *banner;

    it(@"should show compact red one", ^{
        banner = [CVKInfoBanner showWithText:kShortBannerText andStyle:CVKInfoBannerStyleRed];
        expect(banner).will.haveValidSnapshot();
    });

    it(@"should show long red one", ^{
        banner = [CVKInfoBanner showWithText:kLongBannerText andStyle:CVKInfoBannerStyleRed];
        expect(banner).will.haveValidSnapshot();
    });

    it(@"should show compact green one", ^{
        banner = [CVKInfoBanner showWithText:kShortBannerText andStyle:CVKInfoBannerStyleGreen];
        expect(banner).will.haveValidSnapshot();
    });

    it(@"should show long green one", ^{
        banner = [CVKInfoBanner showWithText:kLongBannerText andStyle:CVKInfoBannerStyleGreen];
        expect(banner).will.haveValidSnapshot();
    });

    afterEach(^{
        [banner removeFromSuperview];
    });
});

SpecEnd
