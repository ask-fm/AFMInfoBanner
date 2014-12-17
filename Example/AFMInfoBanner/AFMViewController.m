//
//  AFMViewController.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 11/17/2014.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <AFMInfoBanner.h>
#import "AFMViewController.h"

@interface AFMViewController ()

@property (nonatomic) IBOutlet UITextView *textView;

@end

@implementation AFMViewController

- (IBAction)showGreen:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleInfo];
}

- (IBAction)showRed:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleError];
}

@end
