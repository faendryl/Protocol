#import<Object.h>
#import<Foundation/NSArray.h>

@interface Container:NSObject{
    NSMutableArray *objects;
}

-(void) addObject:(BioObject*)object;
-(NSMutableArray*) matchingObjects:(Class)objectClass;
@end
