#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    if(array == nil || array.count == 0) {
        return 0;
    }
    
    if(number == nil) {
        return array.count;
    }
    
    int counter = 0;
    int first = 0;
    int second = 0;
    for (int i = 0; i < array.count; i++) {
        for(int j = i + 1; j < array.count; j++) {
            first = [array objectAtIndex: i].intValue;
            second = [array objectAtIndex: j].intValue;
            if(first > second && (first - second == number.intValue)) {
                counter++;
            } else if(first < second && (second - first == number.intValue)) {
                counter++;
            }
        }
        
    }
    return counter;
}

@end
