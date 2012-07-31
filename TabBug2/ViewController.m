//
//  ViewController.m
//  TabBug
//
//  Created by Dan Fellmeth on 7/31/12.
//  Copyright (c) 2012 Globus Medical Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tabButton, tabContainer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
	static UIImage *tabImg = nil;
	
	if ( tabImg == nil )
	{
		tabImg = [[UIImage imageNamed:@"tab_stretchable"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 25, 15)];
	}
	
	CGRect frame = tabButton.frame;
	frame.size.height = 25;
	frame.size.width = 177;
	[tabButton setFrame:frame];
	[tabButton setBackgroundImage:tabImg forState:UIControlStateNormal];
	[tabButton addTarget:self action:@selector(tabPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.tabContainer addSubview:tabButton];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)tabPressed:(id)sender
{
	static BOOL open = NO;
	NSString *buttonRect = NSStringFromCGRect(self.tabButton.frame);
	NSLog(@"Button:%@", buttonRect);
	NSLog(@"Tab:%@", NSStringFromCGRect(tabContainer.frame));
	UIWindow *window = [UIApplication sharedApplication].delegate.window;
	CGRect startFrame = tabButton.frame;
	CGRect parentFrame = startFrame;
	CGRect endFrame;
	//	endFrame.origin.x = startFrame.origin.x;
	//	endFrame.size.width = startFrame.size.width;
	
	[tabButton removeFromSuperview];
	
	if ( !open )
	{
		CGRect windowFrame = [window convertRect:parentFrame fromView:tabContainer];
		tabButton.frame = windowFrame;
		[[UIApplication sharedApplication].delegate.window addSubview:tabButton];
		
		endFrame = windowFrame;
		
		endFrame.origin.y = tabButton.frame.origin.y;
		endFrame.size.height = tabButton.frame.size.height;
		
		//		NSLog(@"%@",NSStringFromCGRect(self.frame));
	}
	else
	{		
		CGRect controllerFrame = [tabContainer convertRect:parentFrame fromView:window];
		tabButton.frame = controllerFrame;
		[tabContainer addSubview:tabButton];
		
		endFrame = controllerFrame;
		
		endFrame.origin.y = tabButton.frame.origin.y;
		endFrame.size.height = tabButton.frame.size.height;
		
		//		NSLog(@"%@",NSStringFromCGRect(self.frame));
	}
	
	dispatch_async(queue, ^{
		
	});
	open = !open;
	
	[UIView animateWithDuration:0.5
						  delay:0.0
						options:(UIViewAnimationOptionAllowUserInteraction)
					 animations:^ 
	 {
		 tabButton.frame = endFrame;
	 }
					 completion:^(BOOL finished) {
						 NSLog(@"Tab done:%@", NSStringFromCGRect(tabButton.frame));
						 NSLog(@"Button done:%@", NSStringFromCGRect(self.tabButton.frame));
					 }
	 ];
}

@end
