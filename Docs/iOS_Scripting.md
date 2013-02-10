Documentation
=============

***

NativeUIManager.mm
------------------

### -addListener:(NSObject*)

>Adds a listener, to receive messages from Unity.


### -removeListener:(NSObject*)

>Removes the listener from the list.


### -sendMessageToListener:(NSString*) withMethod:(NSString*) andMessage:(NSString*)

>Performs the selector defined by `method` with the `message` parameter. Messages are passed through the 
list of listeners, and will be executed on any and all registered listeners of the specified type, which 
can perform the selector. 


### -sendMessageToGameObject:(NSString*) withMethod:(NSString*) andMessage:(NSString*)

>Wraps the [UnitySendMessage](http://docs.unity3d.com/Documentation/Manual/PluginsForIOS.html) function, for use in 
native apps. This allows testing without the Unity libraries in your project, and testing in the simulator. 



NativeUI.cs
-----------

### bool pause

>Sets whether the Unity player should pause when a native UI is shown or not.


### showStoryboard( string view )

>Loads a Storyboard UI with no animation. 


### showStoryboard( string view, NativeTransitionAnimation transition ) 

>Loads a Storyboard with the animation defined by transition. 


### showViewControllerFromXibWithAnimation( string xib, NativeTransitionAnimation transition ) 

>Loads a view controller from a XIB, and presents it as a modal view controller with an 
optional animation. 

>Note: The view controller must be the same name as the XIB.


### showViewControllerFromXibWithFrame( string xib, Rect frame )

>Loads a view controller from a XIB and presents in the specified frame, on top of Unity. The frame 
parameter generates a CGRect which internally does pixel doubling for Retina displays. 

>Note: The view is not animated, and the Unity VM is not paused. The view controller must be the 
same name as the XIB. 


### hideUI()

>Hides any native UI and resumes the Unity Player. If the view controller is animated in, it will be animated out appropriately. 


### sendMessageToListener( string listener, string method, string message )

>Passes a message to an Objective-C object which has registered as a listener with the NativeUIManager.

