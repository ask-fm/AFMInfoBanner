//
//  AFMInfoBanner.h
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 6/14/13.
//  Copyright (c) 2013 Ask.fm Europe, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AFMInfoBannerStyle) {
    AFMInfoBannerStyleError = 0,
    AFMInfoBannerStyleInfo,
};

@interface AFMInfoBanner : UIView

@property (nonatomic) AFMInfoBannerStyle style;
@property (nonatomic) NSString *text;

@property (nonatomic) UIFont *font UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *errorBackgroundColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *infoBackgroundColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *errorTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *infoTextColor UI_APPEARANCE_SELECTOR;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;

+ (instancetype)showWithText:(NSString *)text
                       style:(AFMInfoBannerStyle)style
                andHideAfter:(NSTimeInterval)timeout;

+ (instancetype)showAndHideWithText:(NSString *)text
                              style:(AFMInfoBannerStyle)style;

+ (void)hideAll;

@end
