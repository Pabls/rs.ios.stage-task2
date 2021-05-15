#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *res = [[NSMutableString alloc] initWithString: @""];

    NSMutableString *negativeValueError = [[NSMutableString alloc] initWithString: @"Negative numbers are not valid for input."];
    NSMutableString *rangeError = [[NSMutableString alloc] initWithString: @"The numbers in the input array can be in the range from 0 to 255."];
    if(numbersArray == nil || numbersArray.count == 0) {
        return  res;
    }
    
    NSNumber *value;
    unsigned long lastInddex = 3;
    for(int i = 0; i < 4; i++) {

        if(i < numbersArray.count) {
            value = [numbersArray objectAtIndex: i];
            if(value.intValue < 0) {
                res = negativeValueError;
                break;
            }
            if(value.intValue > 255) {
                res = rangeError;
                break;
            }
            if(i < lastInddex) {
                [res appendString: [[NSString alloc] initWithFormat: @"%d.", value.intValue]];
            } else {
                [res appendString: [[NSString alloc] initWithFormat: @"%d", value.intValue]];
            }
        } else {
            if(i < lastInddex) {
                [res appendString: @"0."];
            } else {
                [res appendString: @"0"];
            }
        }
    }
    return  res;
}

@end
