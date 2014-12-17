//
//  AFMTestCommons.h
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 22/11/14.
//  Copyright (c) 2014 Ask.fm Europe, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFMInfoBanner.h"

extern NSString *const kShortBannerText;
extern NSString *const kLongBannerText;

NSString *sanitizedTestName();
NSString *deviceSpecificName();

AFMInfoBanner *bannerManual(NSString *text, AFMInfoBannerStyle style);
AFMInfoBanner *bannerFromHelper(NSString *text, AFMInfoBannerStyle style);
