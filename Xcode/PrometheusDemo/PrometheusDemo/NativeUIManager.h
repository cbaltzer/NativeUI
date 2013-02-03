
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface NativeUIManager : NSObject

@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *addedSubviews;

@property (nonatomic, assign) BOOL pauseOnShowUI;
@property (nonatomic, assign) BOOL viewWasAnimated;

+ (NativeUIManager*)sharedManager;


// Shows a storyboard by name
- (void)showStoryboard:(NSString*)name;
- (void)showStoryboard:(NSString*)name withAnimation:(UIModalTransitionStyle)animation;

// Shows a XIB
-(void)showViewControllerFromXib:(NSString*)xib withAnimation:(UIModalTransitionStyle)animation;
-(void)showViewControllerFromXib:(NSString*)xib withFrame:(CGRect)frame;

// Hides the native UI and returns control to Unity
-(void)hideUI;
-(void)hideSubviews;


// Wrapper for UnitySendMessage
-(void)sendMessageToGameObject:(NSString*)gameObject withMethod:(NSString*)method andMessage:(NSString*)message;

// Toggles pausing the Unity VM
- (void)pauseUnity:(BOOL)shouldPause;


@end

