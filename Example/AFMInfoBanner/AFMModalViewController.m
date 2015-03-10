//
//  AFMModalViewController.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 10/03/15.
//  Copyright (c) 2015 Romans Karpelcevs. All rights reserved.
//

#import <AFMInfoBanner.h>
#import "AFMModalViewController.h"

@interface AFMModalViewController ()

@property (nonatomic) IBOutlet UITextView *textView;

@end

@implementation AFMModalViewController

- (IBAction)showGreen:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleInfo];
}

- (IBAction)showRed:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleError];
}

- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
