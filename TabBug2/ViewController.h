//
//  ViewController.h
//  TabBug
//
//  Created by Dan Fellmeth on 7/31/12.
//  Copyright (c) 2012 Globus Medical Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIButton* tabButton;
@property(nonatomic, strong) IBOutlet UIView* tabContainer;

-(IBAction)tabPressed:(id)sender;

@end
