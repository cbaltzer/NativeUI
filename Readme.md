NativeUI
========

NativeUI is a Unity plugin for launching native views on top of the Unity Player. 
Currently only iOS is supported, but an Android equivalent will be added.

Special thanks to [Prime31](http://www.prime31.com) for the inspiration for this project. It is 
based on their original NativeBinding code, but mostly re-written and updated for using storyboards.

This project contains sample projects for both a native Xcode app, and a Unity project 
which will embed the native app. There is also a Unity package containing the plugin assets.


Setup
-----

The easiest way to work right now is to import the Unity package containing the plugin files.
When you create you Xcode project, make sure you include the plugin Objective-C files into it. Then 
create a build phase which copies all of the necessary files (view controllers, storyboards, etc) into
your `Assets/Plugins/iOS` folder in Unity. Whenever you need to update your native UI, just build (not run)
and it will copy the updates into Unity. Then build your Unity project normally.

You should probably have Symlink Unity Libraries unchecked. 


**Note:** If you copy a .storyboard from Xcode to Unity using a build phase, it will copy it into a localization
 folder (probably `en.lproj`). You will need to move the files up a level out of this folder, into `Plugins/iOS`, as 
subfolders are not supported Unity build process. 

**Note:** The .storyboard and .h files will not show up in the Xcode project generated by Unity, but should still work. 



Documentation
=============


NativeUI.cs
-----------

### bool pause

Sets whether the Unity player should pause when a native UI is shown or not.


### showStoryboard( string view )

Loads a Storyboard UI with no animation. 


### showStoryboard( string view, NativeTransitionAnimation transition ) 

Loads a Storyboard with the animation defined by transition. 


### showViewControllerFromXibWithAnimation( string xib, NativeTransitionAnimation transition ) 

Loads a view controller from a XIB, and presents it as a modal view controller with an 
optional animation. 

Note: The view controller must be the same name as the XIB.


### showViewControllerFromXibWithFrame( string xib, Rect frame )

Loads a view controller from a XIB and presents in the specified frame, on top of Unity. 

Note: The view is not animated, and the Unity VM is not paused. The view controller must be the 
same name as the XIB. 


### hideUI()

Hides any native UI and resumes the Unity Player. If the view controller is animated in, it will be animated out appropriately. 



Common Errors
=============

Storyboard not updating
-----------------------

Sometimes the Storyboard files on the device do not get updated when the app is rebuilt. The easiest fix for this is
to just delete the app from the device and rebuild. 


libobjc.A.dylib`_cache_getImp
-----------------------------

If you get EXC_BAD_ACCESS in this, it is most likely because you are trying to load a Storyboard which does not exist.




