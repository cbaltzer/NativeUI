
#import "NativeUIManager.h"

// defined by the Unity VM
#ifdef UNITY_PRE_IOS6_SDK
void UnityPause( bool pause );
#endif

@implementation NativeUIManager


+ (NativeUIManager*)sharedManager {
	static NativeUIManager *sharedManager = nil;
	
	if( !sharedManager )
		sharedManager = [[NativeUIManager alloc] init];
	
	return sharedManager;
}


- (id)init {
	if( ( self = [super init] ) )
	{
        self.pauseOnShowUI = YES;
		self.viewWasAnimated = NO;
	}
	return self;
}


#pragma mark Storyboarding

- (void)showStoryboard:(NSString*)name {
    [self showStoryboard:name withAnimation:(UIModalTransitionStyle)-1];
    
}

- (void) showStoryboard:(NSString*)name withAnimation:(UIModalTransitionStyle)animation {
    // Pause Unity
    if (self.pauseOnShowUI) {
        [self pauseUnity:YES];
    }
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    NSAssert(sb != nil, @"No storyboard found!");
    
    
    UIViewController *controller = [sb instantiateInitialViewController];
    NSAssert(controller != nil, @"Storyboard has no initial vew controller!");
    
    if ([controller isKindOfClass:UINavigationController.class]) {
        _navigationController = (UINavigationController*)controller;
    } else {
        NSLog(@"No nav controller");
    }
    
    self.viewWasAnimated = NO;
    if (animation >= 0) {
        self.viewWasAnimated = YES;
        controller.modalTransitionStyle = animation;
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController presentViewController:controller animated:self.viewWasAnimated completion:nil];
    
    NSLog(@"Presented Storyboard: %@", name);
}

- (void)hideUI {
    NSLog(@"Hiding view, showing Unity");
    #if TARGET_IPHONE_SIMULATOR
        // This return doesn't seem to be necessary, but might as well just in case
        return;
    #endif
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    if (self.viewWasAnimated) {
        [window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    }
    
    // unpause Unity (should this always be true?) 
    if (self.pauseOnShowUI) {
        [self pauseUnity:YES];
    }
    
	_navigationController = nil;
}


#pragma mark Unity Control

- (void)pauseUnity:(BOOL)shouldPause {
    #ifdef UNITY_PRE_IOS6_SDK
        UnityPause(pause);
    #endif
}


@end
