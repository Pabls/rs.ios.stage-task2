#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if(array == nil || array.count == 0) {
        return @[];
    }
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey: nil ascending:YES];
    NSMutableArray *res = [[NSMutableArray alloc] initWithArray: @[]];
    NSMutableArray *nums = [[NSMutableArray alloc] initWithArray: @[]];
    NSMutableArray *strings = [[NSMutableArray alloc] initWithArray: @[]];
    for (int i = 0; i < array.count; i++) {
        if([[array objectAtIndex: i] isKindOfClass: NSArray.class]) {
            NSArray *innerArray = (NSArray *)[array objectAtIndex: i];
            for (int j = 0; j < innerArray.count; j++) {
                if([[innerArray objectAtIndex: j] isKindOfClass: NSNumber.class])  {
                    [nums addObject: (NSNumber *)[innerArray objectAtIndex: j]];
                } else if([[innerArray objectAtIndex: j] isKindOfClass: NSString.class]) {
                    [strings addObject: (NSString *)[innerArray objectAtIndex: j]];
                }
            }
        } else {
            break;
        }
        
    }
    strings = [strings sortedArrayUsingDescriptors: @[descriptor]];
    nums = [nums sortedArrayUsingDescriptors: @[descriptor]];
    
    if(nums.count == 0) {
        return strings;
    }
    
    if(strings.count == 0) {
        return nums;
    }
    
    [res addObject:nums];
    [res addObject:strings];
    return res;

}

@end
