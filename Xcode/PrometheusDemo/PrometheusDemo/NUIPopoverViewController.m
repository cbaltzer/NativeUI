//
//  NUIPopoverViewController.m
//  PrometheusDemo
//
//  Created by Christopher Baltzer on 2013-02-02.
//  Copyright (c) 2013 Christopher Baltzer. All rights reserved.
//

#import "NUIPopoverViewController.h"
#import "NativeUIManager.h"

@interface NUIPopoverViewController ()

@end

@implementation NUIPopoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideButtonPressed:(UIButton *)sender {
    [[NativeUIManager sharedManager] hideSubviews];
}

- (IBAction)loadButtonPressed:(UIButton *)sender {
    [[NativeUIManager sharedManager] sendMessageToGameObject:@"MainMenu"
                                                  withMethod:@"Load"
                                                  andMessage:@"RedParticles"];
}
@end
