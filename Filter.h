#import <Foundation/NSObject.h>
#import <Object.h>

// Filter describes a set of conditions
// For instance, pass it to Container:matchingObjects to return only the objects that pass the filter

@interface Filter: NSObject{
    NSMutableArray *conditions;
}

-(id) init;
-(BOOL) passes:(BioObject*)object;
@end
