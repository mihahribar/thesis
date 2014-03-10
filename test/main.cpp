#include "gmock/gmock.h"

// g++ -c -I ../src -I ../lib DateTest.cpp
// g++ -o test DateTest.o main.o -I ../lib -L ../lib -lgmock

int main(int argc, char** argv) {
    testing::InitGoogleMock(&argc, argv);
    return RUN_ALL_TESTS();
}
