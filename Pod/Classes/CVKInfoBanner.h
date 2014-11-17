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

@interface CVKInfoBanner : UIControl

@property (nonatomic) UIView *targetView;
@property (nonatomic) CVKInfoBannerStyle style;

- (void)setText:(NSString *)text;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;

+ (instancetype)showWithText:(NSString *)text
                   withStyle:(CVKInfoBannerStyle)style
                andHideAfter:(NSTimeInterval)timeout;

+ (instancetype)showAndHideWithText:(NSString *)text
                          withStyle:(CVKInfoBannerStyle)style;

+ (instancetype)showWithText:(NSString *)text
                    andStyle:(CVKInfoBannerStyle)style;

+ (void)hideAll;
+ (void)hideAllInView:(UIView *)view;

@end
