
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface NativeUIManager : NSObject

@property (nonatomic, retain) UINavigationController *navigationController;

@property (nonatomic, assign) BOOL pauseOnShowUI;
@property (nonatomic, assign) BOOL viewWasAnimated;

+ (NativeUIManager*)sharedManager;


// Shows a storyboard by name
- (void)showStoryboard:(NSString*)name;
- (void)showStoryboard:(NSString*)name withAnimation:(UIModalTransitionStyle)animation;

// Hides the native UI and returns control to Unity
- (void)hideUI;

// Toggles pausing the Unity VM
- (void)pauseUnity:(BOOL)shouldPause;


@end
