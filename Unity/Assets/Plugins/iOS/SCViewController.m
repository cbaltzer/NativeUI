//
//  SCViewController.m
//  PrometheusDemo
//
//  Created by Christopher Baltzer on 2012-11-17.
//  Copyright (c) 2012 Scarlet. All rights reserved.
//

#import "SCViewController.h"
#import "NativeUIManager.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

@end
