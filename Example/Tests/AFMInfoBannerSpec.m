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

__block AFMInfoBanner *banner;

describe(@"AFMInfoBanner view", ^{

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
});

describe(@"AFMInfoBanner show block", ^{

    it(@"should be called when shown without animation", ^{
        banner = [[AFMInfoBanner alloc] init];

        __block BOOL blockCalled = NO;
        void (^block)() = ^void() { blockCalled = YES; };

        [banner setShowCompletionBlock:block];
        [banner show:NO];
        expect(blockCalled).will.beTruthy();

        blockCalled = NO;
        [banner show:NO withCompletion:block];
        expect(blockCalled).will.beTruthy();
    });

    it(@"should be called when shown with animation", ^{
        banner = [[AFMInfoBanner alloc] init];

        __block BOOL blockCalled = NO;
        void (^block)() = ^void() { blockCalled = YES; };

        [banner setShowCompletionBlock:block];
        [banner show:YES];
        expect(blockCalled).will.beTruthy();

        blockCalled = NO;
        [banner show:YES withCompletion:block];
        expect(blockCalled).will.beTruthy();
    });
});

describe(@"AFMInfoBanner hide block", ^{

    it(@"should be called when hidden without animation", ^{
        banner = [[AFMInfoBanner alloc] init];

        __block BOOL blockCalled = NO;
        void (^block)() = ^void() { blockCalled = YES; };

        [banner setHideCompletionBlock:block];
        [banner show:NO];
        [banner hide:NO];
        expect(blockCalled).will.beTruthy();

        blockCalled = NO;
        [banner show:NO];
        [banner hide:NO withCompletion:block];
        expect(blockCalled).will.beTruthy();
    });

    it(@"should be called when hidden with animation", ^{
        banner = [[AFMInfoBanner alloc] init];

        __block BOOL blockCalled = NO;
        void (^block)() = ^void() { blockCalled = YES; };

        [banner setHideCompletionBlock:block];
        [banner show:NO];
        [banner hide:YES];
        expect(blockCalled).will.beTruthy();

        blockCalled = NO;
        [banner show:NO];
        [banner hide:YES withCompletion:block];
        expect(blockCalled).will.beTruthy();
    });

});

afterEach(^{
    [banner removeFromSuperview];
});

SpecEnd
