#import<Object.h>
#import<Foundation/NSArray.h>

@interface Container:NSObject{
    NSMutableArray *objects;
}

-(void) addObject:(BioObject*)object;
-(Container*) matchingObjects:(Class)objectClass;
@end
