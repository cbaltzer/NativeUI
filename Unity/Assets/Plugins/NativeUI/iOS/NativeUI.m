
#import "NativeUI.h"
#import "NativeUIManager.h"


void _showStoryboard( const char *view, int animation) {
	NSString *viewName = [NSString stringWithUTF8String:view];
	
    [[NativeUIManager sharedManager] showStoryboard:viewName withAnimation:animation];
    
}

void _showViewControllerFromXibWithAnimation (const char *xib, int animation) {
    NSString *xibName = [NSString stringWithUTF8String:xib];
    
    [[NativeUIManager sharedManager] showViewControllerFromXib:xibName
                                                 withAnimation:animation];
}

void _showViewControllerFromXibWithFrame( const char *xib, float x, float y, float width, float height ) {
    
    NSString *xibName = [NSString stringWithUTF8String:xib];
    
    [[NativeUIManager sharedManager] showViewControllerFromXib:xibName
                                                     withFrame:CGRectMake(x, y, width, height)];
}

void _hideUI() {
	[[NativeUIManager sharedManager] hideUI];
}


void _sendMessageToListener( const char *listener, const char *method, const char *message) {
    NSString *obj = [NSString stringWithUTF8String:listener];
    NSString *mthd = [NSString stringWithUTF8String:method];
    NSString *msg = [NSString stringWithUTF8String:message];
    
    [[NativeUIManager sharedManager] sendMessageToListener:obj withMethod:mthd andMessage:msg];
}

void _setPauseUnity(bool pause) {
    [NativeUIManager sharedManager].pauseOnShowUI = pause;
}