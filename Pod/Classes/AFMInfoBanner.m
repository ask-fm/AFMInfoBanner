//
//  AFMInfoBanner.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 6/14/13.
//  Copyright (c) 2013 Ask.fm Europe, Ltd. All rights reserved.
//

#import <CVKHierarchySearcher/CVKHierarchySearcher.h>
#import "AFMInfoBanner.h"

#ifdef UIColorFromRGB
    #undef UIColorFromRGB
#endif

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((((rgbValue) & 0xFF0000) >> 16))/255.f \
                                                 green:((((rgbValue) & 0xFF00) >> 8))/255.f \
                                                  blue:(((rgbValue) & 0xFF))/255.f alpha:1.0]

static const CGFloat kMargin = 10.f;
static const NSTimeInterval kAnimationDuration = 0.3;
static const int kRedBannerColor = 0xff0000;
static const int kGreenBannerColor = 0x008000;
static const int kDefaultTextColor = 0xffffff;
static const CGFloat kFontSize = 13.f;
static const CGFloat kDefaultHideInterval = 2.0;

@interface AFMInfoBanner ()

@property (nonatomic, readwrite) BOOL shown;

@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIView *targetView;
@property (nonatomic) UIView *viewAboveBanner;
@property (nonatomic) CGFloat additionalTopSpacing;
@property (nonatomic) NSLayoutConstraint *topSpacingConstraint;
@property (nonatomic) NSLayoutConstraint *topMarginConstraint;

@property (nonatomic) NSTimer *hideTimer;

@property (nonatomic) BOOL needsToSetupViews;

@end

@implementation AFMInfoBanner

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithTargetView:(UIView *)targetView
         viewAboveBanner:(UIView *)viewAboveBanner
    additionalTopSpacing:(CGFloat)additionalTopSpacing
{
    self = [self init];
    if (self) {
        [self setUp];
        self.targetView = targetView;
        self.viewAboveBanner = viewAboveBanner;
        self.additionalTopSpacing = additionalTopSpacing;
        self.needsToSetupViews = NO;
    }
    return self;
}

- (void)setStyle:(AFMInfoBannerStyle)style
{
    _style = style;
    [self applyStyle];
}

- (void)applyStyle
{
    [self applyBackgroundColor];
    [self applyTextColor];
    [self.textLabel setFont:self.font ?: [UIFont boldSystemFontOfSize:kFontSize]];
}

- (void)applyBackgroundColor
{
    if (self.customBackgroundColor) {
        [self setBackgroundColor:self.customBackgroundColor];
    } else {
        if (self.style == AFMInfoBannerStyleError)
            [self setBackgroundColor:self.errorBackgroundColor ?: UIColorFromRGB(kRedBannerColor)];
        else
            [self setBackgroundColor:self.infoBackgroundColor ?: UIColorFromRGB(kGreenBannerColor)];
    }
}

- (void)applyTextColor
{
    if (self.customTextColor) {
        [self.textLabel setTextColor:self.customTextColor];
    } else {
        if (self.style == AFMInfoBannerStyleError)
            [self.textLabel setTextColor:self.errorTextColor ?: UIColorFromRGB(kDefaultTextColor)];
        else
            [self.textLabel setTextColor:self.infoTextColor ?: UIColorFromRGB(kDefaultTextColor)];
    }
}

- (void)setText:(NSString *)text
{
    _text = text;
    [self.textLabel setText:text];
    [self setNeedsLayout];
}

- (void)setErrorBackgroundColor:(UIColor *)errorBackgroundColor
{
    _errorBackgroundColor = errorBackgroundColor;
    [self applyStyle];
}

- (void)setInfoBackgroundColor:(UIColor *)infoBackgroundColor
{
    _infoBackgroundColor = infoBackgroundColor;
    [self applyStyle];
}

- (void)setCustomBackgroundColor:(UIColor *)customBackgroundColor
{
    _customBackgroundColor = customBackgroundColor;
    [self applyStyle];
}

- (void)setErrorTextColor:(UIColor *)errorTextColor
{
    _errorTextColor = errorTextColor;
    [self applyStyle];
}

- (void)setInfoTextColor:(UIColor *)infoTextColor
{
    _infoTextColor = infoTextColor;
    [self applyStyle];
}

- (void)setCustomTextColor:(UIColor *)customTextColor
{
    _customTextColor = customTextColor;
    [self applyStyle];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    [self applyStyle];
}

- (void)setUp
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    UILabel *label = [[UILabel alloc] init];
    [self setTextLabel:label];
    [self configureLabel];
    [self configureTaps];
    [self addSubview:label];
    [self setupConstraints];
    self.topSpacing = 0;
    self.needsToSetupViews = YES;
}

- (void)configureLabel
{
    [self.textLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.textLabel setBackgroundColor:[UIColor clearColor]];
    [self.textLabel setTextAlignment:NSTextAlignmentCenter];
    [self.textLabel setNumberOfLines:0];
}

- (void)configureTaps
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self addGestureRecognizer:tap];
}

- (void)handleTap
{
    if (self.tappedBlock)
        self.tappedBlock();
}

- (void)setupConstraints
{
    // Position label correctly
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|"
                                                                 options:0 metrics:nil views:@{@"label": self.textLabel}]];
    CGFloat topMargin = kMargin + self.additionalTopSpacing;
    NSArray *labelConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[label]-(bottom)-|"
                                                                        options:0
                                                                        metrics:@{@"top": @(topMargin), @"bottom": @(kMargin)}
                                                                          views:@{@"label": self.textLabel}];
    self.topMarginConstraint = [labelConstraints firstObject];
    [self addConstraints:labelConstraints];
}

- (void)setupParentConstraints
{
    // Expand to the superview's width
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|"
                                                                           options:0 metrics:nil views:@{@"self": self}]];

    // Place initial constraint exactly one frame above the bottom line of view above us
    // or above top of screen, if there is no such view. Assign it to property to animate later.
    CGFloat topOffset = -self.frame.size.height;
    if (self.viewAboveBanner)
        topOffset += CGRectGetMaxY(self.viewAboveBanner.frame);
    NSArray *topConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(offset)-[self]"
                                                                      options:0
                                                                      metrics:@{@"offset": @(topOffset)}
                                                                        views:@{@"self": self}];
    self.topSpacingConstraint = [topConstraints firstObject];

    [self.superview addConstraints:topConstraints];
}

- (void)updateConstraints
{
    [super updateConstraints];

    self.topMarginConstraint.constant = kMargin + self.additionalTopSpacing;
    self.topSpacingConstraint.constant = 0;

    if (self.viewAboveBanner)
        self.topSpacingConstraint.constant = CGRectGetMaxY(self.viewAboveBanner.frame);

    if ([self isShown]) {
        self.topSpacingConstraint.constant += self.topSpacing;
    } else {
        self.topSpacingConstraint.constant += -self.frame.size.height;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.preferredMaxLayoutWidth = self.textLabel.frame.size.width;
    [super layoutSubviews];
}

- (void)updateUI
{
    // First pass calculates the height correctly with existing constraints.
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];

    // New pass to take frame and new top constraint, position frame before the animation
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)show:(BOOL)animated withCompletion:(void (^)())completionBlock
{
    self.showCompletionBlock = completionBlock;
    [self show:animated];
}

- (void)hide:(BOOL)animated withCompletion:(void (^)())completionBlock
{
    self.hideCompletionBlock = completionBlock;
    [self hide:animated];
}

- (void)show
{
    [self show:YES];
}

- (void)show:(BOOL)animated
{

    if (self.hideTimer) {
        [self.hideTimer invalidate];
        self.hideTimer = nil;
    }

    if ([self superview]) {
        if (self.showCompletionBlock)
            self.showCompletionBlock();
        return;
    }

    [self applyStyle];

    if (self.needsToSetupViews)
        [self setupViewsAndFrames];

    // In previously indicated, send subview to be below another view.
    // This is used when showing below navigation bar
    if (self.viewAboveBanner)
        [self.targetView insertSubview:self belowSubview:self.viewAboveBanner];
    else
        [self.targetView addSubview:self];

    [self setupParentConstraints];

    [self setHidden:NO];

    self.shown = YES;
    [self updateUI];

    if (animated) {
        self.transform = CGAffineTransformMakeTranslation(0, -(self.topSpacing + self.frame.size.height));

        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (self.showCompletionBlock)
                self.showCompletionBlock();
        }];
    } else {
        if (self.showCompletionBlock)
            self.showCompletionBlock();
    }
}

- (void)showAndHideAfter:(NSTimeInterval)timeout animated:(BOOL)animated
{
    [self show:animated];

    self.hideTimer = [NSTimer scheduledTimerWithTimeInterval:timeout
                                                      target:self
                                                    selector:@selector(scheduledHide:)
                                                    userInfo:@(animated)
                                                     repeats:NO];
}

- (void)scheduledHide:(NSTimer *)timer
{
    BOOL animated = [timer userInfo];
    [self hide:animated];
}

- (void)setupViewsAndFrames
{
    CVKHierarchySearcher *searcher = [[CVKHierarchySearcher alloc] init];
    UIViewController *topmostVC = [searcher topmostViewController];
    UINavigationBar *possibleBar = [self navigationBarFor:topmostVC];
    if (possibleBar && !possibleBar.translucent) {
        [self setupViewsForNavigationBar:possibleBar];
    } else {
        UINavigationController *navVC = [searcher topmostNavigationController];
        if (navVC && navVC.navigationBar.superview && !navVC.navigationBar.translucent) {
            [self setupViewsForNavigationBar:navVC.navigationBar];
        } else {
            [self setupViewsToShowInWindow];
        }
    }
}

- (void)setupViewsForNavigationBar:(UINavigationBar *)possibleBar
{
    self.targetView = possibleBar.superview;
    self.viewAboveBanner = possibleBar;
}

- (void)setupViewsToShowInWindow
{
    // If there isn't a navigation controller with a bar, show in window instead.
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    // Forget the frame convertions, smallest is the height, no doubt
    CGFloat statusBarHeight = MIN(statusBarFrame.size.width, statusBarFrame.size.height);

    self.additionalTopSpacing = statusBarHeight;
    self.targetView = window;
}

- (void)hide
{
    [self hide:YES];
}

- (void)hide:(BOOL)animated
{
    if (self.hideTimer) {
        [self.hideTimer invalidate];
        self.hideTimer = nil;
    }

    self.shown = NO;
    [self updateUI];

    if (animated) {
        self.transform = CGAffineTransformMakeTranslation(0, self.topSpacing + self.frame.size.height);

        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (self.hideCompletionBlock)
                self.hideCompletionBlock();
        }];
    } else {
        [self removeFromSuperview];
        if (self.hideCompletionBlock)
            self.hideCompletionBlock();
    }
}

+ (instancetype)showAndHideWithText:(NSString *)text
                              style:(AFMInfoBannerStyle)style
{
    return [self showWithText:text style:style andHideAfter:kDefaultHideInterval];
}

+ (instancetype)showWithText:(NSString *)text
                       style:(AFMInfoBannerStyle)style
                andHideAfter:(NSTimeInterval)timeout
{
    AFMInfoBanner *banner = [[AFMInfoBanner alloc] init];
    banner.style = style;
    banner.text = text;
    [banner showAndHideAfter:timeout animated:YES];
    return banner;
}

+ (instancetype)showWithText:(NSString *)text
                       style:(AFMInfoBannerStyle)style
                    animated:(BOOL)animated
{
    AFMInfoBanner *banner = [[[self class] alloc] init];
    [banner setText:text];
    [banner setStyle:style];

    [banner show:animated];
    return banner;
}

+ (void)hideAll
{
    UINavigationController *navVC = [[[CVKHierarchySearcher alloc] init] topmostNavigationController];
    [self hideAllInView:navVC.navigationBar.superview];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self hideAllInView:window];
}

+ (void)hideAllInView:(UIView *)view
{
    for (AFMInfoBanner *subview in view.subviews) {
        if ([subview isKindOfClass:[self class]]) {
            [subview hide:NO];
        }
    }
}

- (UINavigationBar *)navigationBarFor:(UIViewController *)viewController
{
    for (UIView *view in viewController.view.subviews) {
        if ([view isKindOfClass:[UINavigationBar class]]) {
            return (UINavigationBar *)view;
        }
    }
    return nil;
}

@end
