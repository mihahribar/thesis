# General

* PhoneGap http://phonegap.com/ / Apache Crodova http://cordova.apache.org/
* Appcelerator Titanium http://www.appcelerator.com/titanium/
* Corona http://www.coronalabs.com/ (Lua, more game oriented)
* Rhomobile http://docs.rhomobile.com/
* Enyo.js http://enyojs.com/
* Unity http://unity3d.com/
* Adobe Air http://www.adobe.com/products/air.html
* ADF Mobile http://www.oracle.com/technetwork/developer-tools/adf-mobile/overview/index.html (Java)
* Codename One http://www.codenameone.com/ (Java)
* Monocross http://monocross.net/
* Worklight http://www-03.ibm.com/software/products/us/en/worklight/
* XMLVM http://xmlvm.org/overview/
* C library + Native wrappers
* J2Objc https://code.google.com/p/j2objc/ (Java to Objective-C)
* Java to C# http://www.microsoft.com/en-us/download/details.aspx?id=14349 (outdated, 2003)
* Sharpen (Java to C#) http://community.versant.com/Projects/html/projectspaces/db4o_product_design/sharpen.html (seems outdated)
* Java to C# http://www.tangiblesoftwaresolutions.com/Product_Details/Java_to_CSharp_Converter.html (1000 line limit for free)
* Automagical http://razum.si/automagical/ (Obj-C to C#)
* Red Foundry http://www.redfoundry.com/
* Qt http://qt-project.org/ (C++)
* PhoneGap + PhoneJS http://phonejs.devexpress.com/
* Javascript: JSContext on iOS, javascript bridge for Android and WP8, could be used with asm.js to speed up but unlikely that devices will pick up on the fact that it is asm.js
* MoSync http://www.mosync.com/ (C++ or HTML/JS)
* PlayN https://code.google.com/p/playn/ (Java, No WP support)
* Marmelade http://www.madewithmarmalade.com/ (iOS, Android, WP8, BB10, Tizen, Windows, Mac, Smart TV)
* RoboVM http://www.robovm.org/ (Java bytecode into native)
* mocl https://wukix.com/mocl (mobile common lisp, for iOS and Android, http://www.reddit.com/r/lisp/comments/1gx556/mocl_common_lisp_for_iphoneios_android_and_other/ > not ready)
* ecl http://ecls.sourceforge.net/ (embeddable common lisp > c/c++, last update one year ago)

Generate native SDK from json-schema?

# C++

* Windows phone 8 C,C++ support http://msdn.microsoft.com/en-us/library/windowsphone/develop/jj681687(v=vs.105).aspx
* Android NDK http://developer.android.com/tools/sdk/ndk/index.html
* Objective-C + C++
* Idea: write C++ code for iOS, Android and Windows Phone, then use Emscripten (https://github.com/kripken/emscripten) to transpile from C++ to JavaScript.

# Lua

* iPhone http://www.luanova.org/ioswithlua
* Windows Phone 8 http://code.msdn.microsoft.com/wpapps/using-lua-on-windows-phone-37eb8bb4
* Android https://code.google.com/p/android-scripting/

# Higher language compiled into lower

* Haxe http://haxe.org/ (JavaScript, Flash, PHP, C++, C#, Java) https://github.com/HaxeFoundation/haxe

Because Apple, Google and Windows Phone are competitors in the same space, there is little chance either will officially support the other platforms - so we are destined to use open source libraries to bridge the gaps in mobile phone development.

Facebook + HTML5 a mistake
"The biggest mistake we made as a company was betting too much on HTML5 as opposed to native," Mark Zuckerberg, Sep 2012
http://mashable.com/2012/09/11/html5-biggest-mistake/

# Emscripten

* https://gist.github.com/nathanhammond/1974955 How to get Emscripten running on OS X.

# Sources

* http://www.quora.com/What-are-the-things-to-consider-when-choosing-between-different-cross-platform-mobile-development-tools-ie-Corona-Rhomobile-Titanium-and-PhoneGap
* http://www.slideshare.net/michelescandura/cross-platform-development-with-c
* http://stackoverflow.com/a/5234868/165708
* http://en.wikipedia.org/wiki/Source-to-source_compiler
* https://medium.com/tech-talk/a28d741eb2f9
* http://blog.bignerdranch.com/3784-javascriptcore-and-ios-7/
* http://philjordan.eu/article/mixing-objective-c-c++-and-objective-c++
* http://mozakai.blogspot.com/2012/03/howto-port-cc-library-to-javascript.html (emscripten)
* http://blog.burhum.com/post/36166554007/cross-platform-ios-android-mobile-app-development
* http://blog.edwards-research.com/2012/04/tutorial-android-jni/
* http://kripken.github.io/mloc_emscripten_talk/
* http://blog.qburst.com/2012/10/multiplatform-implementation-of-algorithms-by-sharing-a-c-code-base/
* http://www.lextech.com/2013/02/static-libraries-in-ios/ (sharing code as a static library)
* http://stackoverflow.com/questions/13861769/use-a-simple-c-class-in-android-ndk (ended up using SWIG)
* https://github.com/kripken/emscripten/wiki/embind
* http://mozakai.blogspot.com/2011/11/code-size-when-compiling-to-javascript.html (2mb + closure compiler + gzip =  60kb)
