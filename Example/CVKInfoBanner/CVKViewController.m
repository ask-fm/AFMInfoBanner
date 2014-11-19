//
//  CVKViewController.m
//  CVKInfoBanner
//
//  Created by Romans Karpelcevs on 11/17/2014.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <CVKInfoBanner.h>
#import "CVKViewController.h"

@interface CVKViewController ()

@property (nonatomic) IBOutlet UITextView *textView;

@end

@implementation CVKViewController

- (IBAction)showGreen:(id)sender
{
    [CVKInfoBanner showAndHideWithText:self.textView.text style:CVKInfoBannerStyleGreen];
}

- (IBAction)showRed:(id)sender
{
    [CVKInfoBanner showAndHideWithText:self.textView.text style:CVKInfoBannerStyleRed];
}

@end
