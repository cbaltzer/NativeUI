
#import <Foundation/Foundation.h>


void _showStoryboard( const char *view, int animation );

void _showViewControllerFromXibWithAnimation( const char *xib, int animation );
void _showViewControllerFromXibWithFrame( const char *xib, float x, float y, float width, float height );

void _hideUI();

void _sendMessageToListener( const char *listener, const char *method, const char *message);

void _setPauseUnity(bool pause);