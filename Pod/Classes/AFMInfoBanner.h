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

@property (nonatomic, copy) void (^showCompletionBlock)();
@property (nonatomic, copy) void (^hideCompletionBlock)();
@property (nonatomic, copy) void (^tappedBlock)();

@property (nonatomic) UIFont *font UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *errorBackgroundColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *infoBackgroundColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *errorTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *infoTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat topSpacing UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *customBackgroundColor;
@property (nonatomic) UIColor *customTextColor;

- (id)initWithTargetView:(UIView *)targetView
         viewAboveBanner:(UIView *)viewAboveBanner
    additionalTopSpacing:(CGFloat)additionalTopSpacing;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)show:(BOOL)animated withCompletion:(void (^)())completionBlock;
- (void)hide:(BOOL)animated withCompletion:(void (^)())completionBlock;
- (void)showAndHideAfter:(NSTimeInterval)timeout animated:(BOOL)animated;

+ (instancetype)showWithText:(NSString *)text
                       style:(AFMInfoBannerStyle)style
                andHideAfter:(NSTimeInterval)timeout;
+ (instancetype)showWithText:(NSString *)text
                       style:(AFMInfoBannerStyle)style
                    animated:(BOOL)animated;
+ (instancetype)showAndHideWithText:(NSString *)text
                              style:(AFMInfoBannerStyle)style;
+ (void)hideAll;

@end
