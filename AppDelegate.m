//
//  AppDelegate.m
//  WebPluginWebViewTester
//
//  Created by Marc Liyanage on 05.03.09.
//  Copyright 2009 Marc Liyanage <http://www.entropy.ch>. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)awakeFromNib {

	NSURL *testUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:testUrl]];

}

@end
