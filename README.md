# AFMInfoBanner

[![CI Status](http://img.shields.io/travis/ask-fm/AFMInfoBanner.svg?style=flat)](https://travis-ci.org/ask-fm/AFMInfoBanner)
[![Version](https://img.shields.io/cocoapods/v/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)
[![License](https://img.shields.io/cocoapods/l/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)
[![Platform](https://img.shields.io/cocoapods/p/AFMInfoBanner.svg?style=flat)](http://cocoadocs.org/docsets/AFMInfoBanner)

AFMInfoBanner can be used to unobtrusively notify users about successful or erroneous events which do not require any specific action or UI locking. Good examples are network errors on the screens which can be functional even without the data that failed.

Default error case looks like this:

![Animated Example](https://raw.githubusercontent.com/ask-fm/AFMInfoBanner/master/res/red_banner.gif)

View is trying to find a navigation bar and show itself beneath it. If that fails, it shows from top of the window, adjusting height to be below status bar. View is resized to any text, but auto-hiding interval makes long text hard to read, so it's better to keep it short.

Background and text colours, as well as font are customisable through `UIAppearance`.

## Usage

There are two styles: `AFMInfoBannerStyleError` for error messages and `AFMInfoBannerStyleInfo` for other, like info or success notices. By default error is red and info is green.

Easiest way to use it is calling a class method passing text and kind of message:

```objective-c
[AFMInfoBanner showAndHideWithText:@"Error text" style:AFMInfoBannerStyleError];
```

If you need another hiding interval, you can pass it like this:

```objective-c
[AFMInfoBanner showWithText:@"Error text" style:AFMInfoBannerStyleError andHideAfter:1.0];
```

If you want to create or show it yourself, as well as have a overriding point in case of inheritance, there are `-show:` and `-hide:` methods available.

If you need to hide any possibly showing banner, use `+[AFMInfoBanner hideAll]`. Possible case for this is navigating away from the page. Without this banner is going to stay visible during navigation because it is attached to navigation bar's view.

You can use Example project to play around with AFMInfoBanner. To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 7 and up.

Usage of `UINavigationBar` or `UINavigationController` for navigation bar.

Algorithm uses view controller hierarchy ([CVKHierarchySearcher](https://github.com/coverback/CVKHierarchySearcher)) to find navigation bar on the topmost view controller. First it checks the topmost controller's first level of subviews for `UINavigationBar`. If this fails, searches for topmost available `UINavigationController`. If that fails as well, shows from the status bar. Because of this logic, might work strangely with custom navigation bar replacements.

## Installation

AFMInfoBanner is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'AFMInfoBanner'

## Contact person

Romans Karpelcevs, roman@ask.fm

## License

AFMInfoBanner is available under the MIT license. See the LICENSE file for more info.

