//
//  CVKTestCommons.h
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 22/11/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVKInfoBanner.h"

extern NSString *const kShortBannerText;
extern NSString *const kLongBannerText;

NSString *sanitizedTestName();
NSString *deviceSpecificName();

CVKInfoBanner *bannerManual(NSString *text, CVKInfoBannerStyle style);
CVKInfoBanner *bannerFromHelper(NSString *text, CVKInfoBannerStyle style);
