# Razvoj medplatformne knjižnice

[![Build Status](https://travis-ci.org/mihahribar/thesis.png?branch=master)](https://travis-ci.org/mihahribar/thesis)

Cilj diplomske naloge je pregled metod za medplatformni razvoj knjižnice za [RRULE RFC5545](https://tools.ietf.org/html/rfc5545#section-3.3.10), ki jo bo možno vključiti v obstoječo iOS, Android, Windows Phone in spletno aplikacijo. Najprej si bomo ogledali možne rešitve, njihove prednosti in slabosti. Na koncu si bomo izbrali najboljšo metodo, naredili testno knjižnico in pokazali, kako jo je možno vključiti v vsako od naštetih platform.

Glede na raziskane metode je za razvoj medplatformne knjižnice najboljše uporabiti jezik C/C++, ki ga je možno prevesti na LLVM (Low Level Virtual Machine) infrastrukturo s pomočjo orodja `llvm-gcc` ali `clang`, ter nato uporabiti orodje [emscripten](https://github.com/kripken/emscripten), ki zna LLVM kodo prevesti v JavaScript.

C++ -> llvm-gcc | clang -> LLVM -> emscripten -> Javascript

V vsako od omenjenih platform je možno vklučiti C++ knjižnico na različne načine:
* iOS platforma že sama po sebi omogoča uporabo C++ kode.
* Windows Phone je z različico 8 podprl uporabo C++ kode.
* Android nam uporabo C++ omogoča s pomočjo knjižnice [NDK](http://developer.android.com/tools/sdk/ndk/).
* Za spletno aplikacijo lahko s pomočjo orodja emscripten uporabimo isto C++ kodo, prevedeno v Javascript.

## Kazalo

1. Uvod
  1. Predstavitev problema
  2. Funkcije medplatformne knjižnice
2. Pregled metod medplaformnega razvoja
  1. Celovit
      1. Qt
      2. Xamarin
      3. Adobe AIR
  2. Hibriden
      1. PhoneGap
      2. Appcelerator Titanium
  3. Deljen
      1. Lua
      2. Haxe
      3. XMLVM
      4. C++ in emscripten
3. Razvoj knjižnice
  1. C++
  2. Emscripten
  3. Omejitve
4. Vključitev knjižnice v platforme
  1. iOS
  2. Android
  3. Windows Phone
  4. Spletna aplikacija
5. Zaključne ugotovitve
