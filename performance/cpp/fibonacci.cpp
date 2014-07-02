#include "fibonacci.hpp"

namespace Thesis {
    int Fibonacci::generateNumber(int n) {
        int j = 0, k = 1, sum = 0;

        for (int i = 0; i < n-1; i++)
        {
            sum = j + k;
            j = k;
            k = sum;
        }

        return sum;
    }

    void Fibonacci::empty() {}
}