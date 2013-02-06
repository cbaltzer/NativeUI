
#import "NativeUIManager.h"


extern void UnityPause( bool pause );
extern void UnitySendMessage(const char *, const char *, const char *);


@implementation NativeUIManager


+(NativeUIManager*)sharedManager {
	static NativeUIManager *sharedManager = nil;
	
	if( !sharedManager )
		sharedManager = [[NativeUIManager alloc] init];
	
	return sharedManager;
}

-(id)init {
	if( ( self = [super init] ) )
	{
        self.pauseOnShowUI = YES;
		self.viewWasAnimated = NO;
        self.addedSubviews = [NSMutableArray arrayWithCapacity:2]; //initially 2
        self.listeners = [NSMutableArray array];
	}
	return self;
}



#pragma mark - Presenting Storyboard

-(void)showStoryboard:(NSString*)name {
    [self showStoryboard:name withAnimation:(UIModalTransitionStyle)-1];
    
}

-(void) showStoryboard:(NSString*)name withAnimation:(UIModalTransitionStyle)animation {
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



#pragma mark - Presenting XIB

-(void)showViewControllerFromXib:(NSString *)xib withAnimation:(UIModalTransitionStyle)animation{
    
    UIViewController *vc = [[NSClassFromString(xib) alloc] initWithNibName:xib bundle:nil];
    NSLog(@"Presenting %@ from Xib", [vc class]);
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.viewWasAnimated = NO;
    if (animation >= 0) {
        self.viewWasAnimated = YES;
        vc.modalTransitionStyle = animation;
    }
    
    if (self.pauseOnShowUI) {
        [self pauseUnity:YES];
    }
    
    [window.rootViewController presentViewController:vc animated:YES completion:nil];
}

-(void)showViewControllerFromXib:(NSString*)xib withFrame:(CGRect)frame {
    UIViewController *vc = [[NSClassFromString(xib) alloc] initWithNibName:xib bundle:nil];
    NSLog(@"Presenting %@ from Xib", [vc class]);
    
    vc.view.frame = frame;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [self.addedSubviews addObject:vc.view];
    [window.rootViewController.view addSubview:vc.view];
}



#pragma mark - Hiding

-(void)hideUI {
    NSLog(@"Hiding view, showing Unity");    
    #if TARGET_IPHONE_SIMULATOR
        // This return doesn't seem to be necessary, but might as well just in case
        return;
    #endif
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    // remove subviews first
    [self hideSubviews];
    
    if (self.viewWasAnimated) {
        [window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    }
    
    // unpause Unity (should this always be true?) 
    if (self.pauseOnShowUI) {
        [self pauseUnity:NO];
    }
    
	_navigationController = nil;
}

-(void)hideSubviews {
    for (UIView *subview in self.addedSubviews) {
        [subview removeFromSuperview];
    }
    [self.addedSubviews removeAllObjects];
}



#pragma mark - Message passing

-(void)addListener:(NSObject*)listener {
    [self.listeners addObject:listener];
}

-(void)removeListener:(NSObject*)listener {
    [self.listeners removeObject:listener];
}

-(void)sendMessageToListener:(NSString*)listener withMethod:(NSString*)method andMessage:(NSString*)message {
    NSLog(@"Receiving message, passing to listeners");
    for (NSObject* object in self.listeners) {
        if ([object isKindOfClass:NSClassFromString(listener)]) {
            if ([object respondsToSelector:NSSelectorFromString(method)]) {
                NSLog(@"Performing selector(%@:%@) on %@", method, message, listener);
                [object performSelector:NSSelectorFromString(method) withObject:message];
            }
        }
    }
}

-(void)sendMessageToGameObject:(NSString*)gameObject withMethod:(NSString*)method andMessage:(NSString*)message {
    NSLog(@"Sending GameObject %@ message: %@(%@)", gameObject, method, message);
    UnitySendMessage([gameObject UTF8String], [method UTF8String], [message UTF8String]);
}


#pragma mark - Unity Control

-(void)pauseUnity:(BOOL)shouldPause {
    UnityPause(shouldPause);
}



// Stubs to allow compilation without the Unity libs
void UnitySendMessage(const char * go, const char * method, const char * message) {}
void UnityPause(bool pause) {}

@end
