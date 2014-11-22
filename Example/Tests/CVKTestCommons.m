//
//  CVKTestCommons.m
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 22/11/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import "CVKTestCommons.h"

NSString *const kShortBannerText = @"Short error text";
NSString *const kLongBannerText = @"Longer text which definitely would be shown on multiple lines and wrap.";

NSString *sanitizedTestName()
{
    SPTSpec *currrentSpec = [[NSThread currentThread] threadDictionary][@"SPTCurrentSpec"];
    NSString *name = [[[currrentSpec.name componentsSeparatedByString:@" test_"] lastObject] stringByReplacingOccurrencesOfString:@"]" withString:@""];
    return name;
}

NSString *deviceSpecificName()
{
    return [NSString stringWithFormat:@"%@-%.0f",
            sanitizedTestName(),
            CGRectGetWidth([[UIScreen mainScreen] bounds])];
}

CVKInfoBanner *bannerManual(NSString *text, CVKInfoBannerStyle style)
{
    CVKInfoBanner *banner = [[CVKInfoBanner alloc] init];
    banner.text = text;
    banner.style = style;
    [banner show:YES];
    return banner;
}

CVKInfoBanner *bannerFromHelper(NSString *text, CVKInfoBannerStyle style)
{
    return [CVKInfoBanner showAndHideWithText:text style:style];
}
