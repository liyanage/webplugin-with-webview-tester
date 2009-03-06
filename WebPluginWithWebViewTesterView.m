//
//  WebPluginWithWebViewTesterView.m
//  WebPluginWithWebViewTester
//
//  Created by Marc Liyanage on 06.03.09.
//  Copyright Marc Liyanage <http://www.entropy.ch> 2009. All rights reserved.
//

#import "WebPluginWithWebViewTesterView.h"


@interface WebPluginWithWebViewTesterView (Internal)
- (id)_initWithArguments:(NSDictionary *)arguments;
@end

@implementation WebPluginWithWebViewTesterView

// WebPlugInViewFactory protocol
// The principal class of the plug-in bundle must implement this protocol.

+ (NSView *)plugInViewWithArguments:(NSDictionary *)newArguments
{
    return [[[self alloc] _initWithArguments:newArguments] autorelease];
}

// WebPlugIn informal protocol

- (void)webPlugInInitialize
{
    // This method will be only called once per instance of the plug-in object, and will be called
    // before any other methods in the WebPlugIn protocol.
    // You are not required to implement this method.  It may safely be removed.
}

- (void)webPlugInStart
{
    // The plug-in usually begins drawing, playing sounds and/or animation in this method.
    // You are not required to implement this method.  It may safely be removed.
}

- (void)webPlugInStop
{
    // The plug-in normally stop animations/sounds in this method.
    // You are not required to implement this method.  It may safely be removed.
}

- (void)webPlugInDestroy
{
    // Perform cleanup and prepare to be deallocated.
    // You are not required to implement this method.  It may safely be removed.
}

- (void)webPlugInSetIsSelected:(BOOL)isSelected
{
    // This is typically used to allow the plug-in to alter its appearance when selected.
    // You are not required to implement this method.  It may safely be removed.
}

- (id)objectForWebScript
{
    // Returns the object that exposes the plug-in's interface.  The class of this object can implement
    // methods from the WebScripting informal protocol.
    // You are not required to implement this method.  It may safely be removed.
    return self;
}

- (void)setFrame:(NSRect)frameRect {
	[super setFrame:frameRect];
	[webView setFrame:[self bounds]];
}

- (void)dealloc {
	[webView release];
	[super dealloc];
}



@end

@implementation WebPluginWithWebViewTesterView (Internal)

- (id)_initWithArguments:(NSDictionary *)newArguments
{
    if (!(self = [super initWithFrame:NSZeroRect]))
        return nil;
		
	webView = [[WebView alloc] initWithFrame:NSMakeRect(10, 10, 100, 100) frameName:@"testFrame" groupName:@"testGroup"];
	[webView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
	[self addSubview:webView];

	NSURL *testUrl = [NSURL fileURLWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"test-plugin" ofType:@"html"]];
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:testUrl]];
    NSLog(@"webplugin init %@", testUrl);
    return self;
}


@end
