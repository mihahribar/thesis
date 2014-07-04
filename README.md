# Razvoj medplatformne knjižnice za uporabo v mobilnih in spletnih aplikacijah

[![Build Status](https://travis-ci.org/mihahribar/thesis.png?branch=master)](https://travis-ci.org/mihahribar/thesis)

Razvoj aplikacij za več različnih platform je težaven. Odpira veliko možnosti za napake, oteži testiranje in odpravljanje napak ter skoraj onemogoči sočasno nadgrajevanje aplikacij. Rezultat so dolgotrajni razvojni cikli in počasno dodajanje funkcionalnosti, kar v današnjem svetu zagonskih podjetij ni zaželeno.

Kljub razlikam med posameznimi platformami je ponavadi veliko kode z identično funkcionalnostjo, ki jo je potrebno razviti za vsako platformo posebej. Rešitev iz te zagate je razvoj medplatformne knjižnice.

Cilj diplomske naloge je razvoj knjižnice za specifikacijo [RFC 5545](https://tools.ietf.org/html/rfc5545#section-3.3.10), ki omogoča generiranje ponavljajočih koledarskih dogodkov in jo je možno uporabiti v spletni, iOS, Android in Windows Phone aplikaciji. Pregledali bomo različne možne pristope, navedli prednosti in slabosti ter na koncu izbrali najprimernejšo rešitev za implementacijo knjižnice.

# Developing a cross platform library for use in mobile and web applications

Developing applications for different platforms is complicated. It opens a lot of avenues for mistakes, complicates testing and bugfixing, while almost completely destroys any chance of simultaneous application upgrade. The result of this are prolonged development cycles and slow feature creep, which in todays ``startup'' world is not an option.

Despite the differences between platforms, they most likely share a lot of functionality which has to be developed for each platform. The solution to this problem is to develop a cross-platform library.

The goal of the thesis is to develop a library for the [RFC 5545](https://tools.ietf.org/html/rfc5545#section-3.3.10) specification, which enables applications to schedule and display recurring events. The library will then be used in a web, iOS, Android and Windows Phone application. We will outline different approaches to writing the shared library, list the pros and cons and in the end decide on the best approach.
