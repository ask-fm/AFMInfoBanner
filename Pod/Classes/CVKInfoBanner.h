//
//  CVKInfoBanner.h
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 6/14/13.
//  Copyright (c) 2013 Romans Karpelcevs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CVKInfoBannerStyle) {
    CVKInfoBannerStyleRed = 0,
    CVKInfoBannerStyleGreen,
};

@interface CVKInfoBanner : UIView

@property (nonatomic) CVKInfoBannerStyle style;
@property (nonatomic) NSString *text;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;

+ (instancetype)showWithText:(NSString *)text
                       style:(CVKInfoBannerStyle)style
                andHideAfter:(NSTimeInterval)timeout;

+ (instancetype)showAndHideWithText:(NSString *)text
                              style:(CVKInfoBannerStyle)style;

+ (void)hideAll;

@end
