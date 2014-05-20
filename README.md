# Razvoj medplatformne knjižnice za uporabo v mobilnih in spletnih aplikacijah

[![Build Status](https://travis-ci.org/mihahribar/thesis.png?branch=master)](https://travis-ci.org/mihahribar/thesis)

Cilj diplomske naloge je pregled metod za medplatformni razvoj knjižnice za [RRULE RFC5545](https://tools.ietf.org/html/rfc5545#section-3.3.10), ki jo bo možno vključiti v obstoječo iOS, Android, Windows Phone in spletno aplikacijo. Najprej si bomo ogledali možne rešitve, njihove prednosti in slabosti. Na koncu si bomo izbrali najboljšo metodo, naredili testno knjižnico in pokazali, kako jo je možno vključiti v vsako od naštetih platform.

Glede na raziskane metode je za razvoj medplatformne knjižnice najboljše uporabiti jezik C/C++, ki ga je možno prevesti na LLVM (Low Level Virtual Machine) infrastrukturo s pomočjo orodja `llvm-gcc` ali `clang`, ter nato uporabiti orodje [emscripten](https://github.com/kripken/emscripten), ki zna LLVM kodo prevesti v JavaScript.

C++ -> llvm-gcc | clang -> LLVM -> emscripten -> Javascript

V vsako od omenjenih platform je možno vklučiti C++ knjižnico na različne načine:
* iOS platforma že sama po sebi omogoča uporabo C++ kode.
* Windows Phone je z različico 8 podprl uporabo C++ kode.
* Android nam uporabo C++ omogoča s pomočjo knjižnice [NDK](http://developer.android.com/tools/sdk/ndk/).
* Za spletno aplikacijo lahko s pomočjo orodja emscripten uporabimo isto C++ kodo, prevedeno v Javascript.
