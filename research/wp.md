# Windows Phone C++

Native code can’t be called from Windows Phone OS 7.0 or Windows Phone OS 7.1 apps. Only Windows Phone 8 apps can use this feature. [1]

Windows Phone Runtime mixes managed and native code. Managed and Native code are incompatible by nature but this API can be consumed by both.

You can't use a C++ object directly in your C# app. you need to first write a Windows Runtime Component [4]

A static library that's used in a Windows Store app can contain ISO-standard C++ code, including STL types, and also calls to Win32 APIs that are not excluded from the Windows Store app platform. A static library consumes Windows Runtime components and may create Windows Runtime components with certain restrictions. [6]

In general, when you code your C++ component, use the regular C++ library and built-in types, except at the abstract binary interface (ABI) boundary where you are passing data to and from code in another .winmd package. There, use Windows Runtime types and the special syntax that Visual C++ supports for creating and manipulating those types. [8]

Resources

* http://msdn.microsoft.com/en-us/library/windowsphone/develop/jj681687(v=vs.105).aspx
* http://code.msdn.microsoft.com/windowsapps/Windows-8-app-samples-4d76cbbf
* http://msdn.microsoft.com/en-us/library/windows/apps/hh994636.aspx
* http://developer.nokia.com/community/wiki/C++_support_from_Windows_Phone_8
* http://msdn.microsoft.com/library/windows/apps/hh699871.aspx Visual C++ Language Reference
* http://msdn.microsoft.com/en-us/library/windows/apps/hh771041.aspx
* http://developer.nokia.com/community/wiki/C++_support_from_Windows_Phone_8#Mixed_application
* http://msdn.microsoft.com/library/windows/apps/hh441569.aspx Creating Windows Runtime Components in C++