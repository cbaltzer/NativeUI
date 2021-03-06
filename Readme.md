WARNING
=======

I have not done Unity development in many years, and have no intention of updating or maintaining this package and am archiving the repo. Feel free to fork away.


***


NativeUI
========

NativeUI is a Unity plugin for launching native views on top of the Unity Player. 
Currently only iOS is supported, but an Android equivalent will be added, eventually.

This project contains sample projects for both a native Xcode app, and a Unity project 
which will embed the native app. There is also a Unity package containing the plugin assets.


### Notes

- Developed and tested using Unity 4.0. It _should_ work with Unity 3.5, but is untested. 
- The Xcode demo has a build phase with an absolute path from my machine in it. Please remember to change it before you try to build! 


Documentation
-------------

### iOS
- [Setup and workflow](Docs/iOS_Setup.md)
- [Examples](Docs/iOS_Examples.md)
- [Scripting](Docs/iOS_Scripting.md)


Warranty
--------

There is none. Use at your own risk. 


Thanks
------

Special thanks to [Prime31](http://www.prime31.com) for the inspiration for this project. It is 
based on their original 
[NativeBinding](https://github.com/prime31/P31UnityAddOns/tree/faca2ae8a7f38374b8a93b8e7d828fcf979b9bda) 
code, but mostly re-written and updated for using storyboards.
