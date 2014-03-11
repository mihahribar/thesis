import os, sys

bundle = open(sys.argv[1], 'a')
bundle.write('''

this['Thesis'] = Module; // With or without a closure, the proper usage is Thesis.*

''')
bundle.close()
