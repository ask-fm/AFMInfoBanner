//
//  AFMInitialViewController.m
//  AFMInfoBanner
//
//  Created by Romans Karpelcevs on 10/03/15.
//  Copyright (c) 2015 Romans Karpelcevs. All rights reserved.
//

#import <AFMInfoBanner.h>
#import "AFMInitialViewController.h"

@interface AFMInitialViewController ()

@property (nonatomic) IBOutlet UITextView *textView;

@end

@implementation AFMInitialViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    static BOOL firstTime = YES;
    if (firstTime) {
        firstTime = NO;
        UIViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"navVC"];
        [self presentViewController:newVC animated:YES completion:nil];
    }
}

- (IBAction)showGreen:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleInfo];
}

- (IBAction)showRed:(id)sender
{
    [AFMInfoBanner showAndHideWithText:self.textView.text style:AFMInfoBannerStyleError];
}

@end
