#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    NSString *string = @"" ;
    NSUInteger x = n;
    

    while (x > 0) {
       string = [string stringByAppendingString: [NSString stringWithFormat: @"%lu", x&1]];
       x = x >> 1;
    }
    
    unsigned long c = 8 - string.length;
    for(int i = 0; i < c; i++) {
        string = [string stringByAppendingString: [NSString stringWithFormat: @"%d", 0]];
    }
    
    int result = 0;
    for(int i = 0; i < 8; i++) {
        long res = [[[string substringFromIndex:i] substringToIndex: 1] integerValue];
        if(res == 1) {
            result += pow(2, 7 - i);
        }
    }
    return result;
}
