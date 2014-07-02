#import "fibonacci.h"
#import "fibonacci.hpp"

@implementation ThesisFibonacci

+ (NSInteger)generateNumber:(NSInteger)n {
    return Thesis::Fibonacci::generateNumber(n);
}

+ (void)empty {
    Thesis::Fibonacci::empty();
}

@end