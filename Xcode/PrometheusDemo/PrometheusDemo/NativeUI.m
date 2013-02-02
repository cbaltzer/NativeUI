
#import "NativeUI.h"
#import "NativeUIManager.h"


void _showStoryboard( const char *view, int animation) {
	NSString *viewName = [NSString stringWithUTF8String:view];
	
    [[NativeUIManager sharedManager] showStoryboard:viewName withAnimation:animation];
    
}


void _hideUI() {
	[[NativeUIManager sharedManager] hideUI];
}

void _setPauseUnity(bool pause) {
    [NativeUIManager sharedManager].pauseOnShowUI = pause;
}