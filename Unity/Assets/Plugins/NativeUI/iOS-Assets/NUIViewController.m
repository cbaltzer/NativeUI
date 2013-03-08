//
//  NUIViewController.m
//  PrometheusDemo
//
//  Created by Christopher Baltzer on 2012-12-08.
//  Copyright (c) 2012 Christopher Baltzer. All rights reserved.
//

#import "NUIViewController.h"
#import "NativeUIManager.h"

@interface NUIViewController ()

@end

@implementation NUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NativeUIManager sharedManager] addListener:self];
    
}

-(void)logMessage:(NSString*)message {
    NSLog(@"Received message: %@", message);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)hideView:(UIButton*)sender
{
    [[NativeUIManager sharedManager] hideUI];
}

- (IBAction)popupSwitchToggled:(UISwitch *)sender {
    if (sender.on) {
        [[NativeUIManager sharedManager] showViewControllerFromXib:@"NUIPopoverViewController"
                                                         withFrame:CGRectMake(0, 380, 320, 140)];
        
    } else {
        
        [[NativeUIManager sharedManager] hideSubviews];
        
    }
}

@end
