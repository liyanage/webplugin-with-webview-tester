//
//  WebPluginWithWebViewTesterView.h
//  WebPluginWithWebViewTester
//
//  Created by Marc Liyanage on 06.03.09.
//  Copyright Marc Liyanage <http://www.entropy.ch> 2009. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface WebPluginWithWebViewTesterView : NSView <WebPlugInViewFactory>
{
	WebView *webView;
}

@end
